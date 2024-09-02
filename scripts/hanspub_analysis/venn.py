def read_analysis(filename: str) -> dict[str: int]:
    with open(filename, 'r', encoding='utf-8') as file:
        res = {}
        for line in file:
            if not line.strip() or line.startswith('#'):
                continue
            codepoint, _, frequency = line.strip().split('\t')
            res[int(codepoint.replace('U+', ''), 16)] = int(frequency, 10)
        return res

# Read codepoints from a file with 'U+xxxxxx' format
def read_codepoints_from_file(filename: str) -> set[int]:
    with open(filename, 'r', encoding='utf-8') as file:
        return {int(line.strip().replace('U+', ''), 16) for line in file if line.strip() and not line.startswith('#')}

def venn(
    name_A: str,
    A: set,
    name_B: str,
    B: set,
    _print = False
) -> dict[str, set]:
    res = {
        name_A: A - B,
        'intersection': A.intersection(B),
        name_B: B - A,
    }
    if _print:
        print("# {} ( {} ( {} ) {} ) {}".format(
              name_A,
              len(res[name_A]),
              len(res['intersection']),
              len(res[name_B]),
              name_B,
        ))
    return res

#iicore = read_codepoints_from_file('../cache/unihan_iicore.txt')
core2020 = read_codepoints_from_file('../cache/unihan_core2020.txt')

#venn('iicore', iicore, 'core2020', core2020, True)

analysis = read_analysis('89500-95300.tsv')
analysis_codepoints = set(analysis.keys())

venn('core2020', core2020, 'analysis', analysis_codepoints, True)

eLabFont = read_codepoints_from_file('../eLabFTWNoto-Regular.ttf.codepoints')

res = venn('eLabFont', eLabFont, 'core2020', core2020, True)

[print(f'{codepoint:06X}') for codepoint in res['core2020'] if codepoint < int(0x20000)]

res = venn('eLabFont', eLabFont, 'analysis', analysis_codepoints, True)

# Let's see what is missing
# exclude all Supplementary Ideographic Plane (SIP) (>=20000) and Private Use Area (E000–F8FF) codepoints
#[print(f'{codepoint:06X}\t{chr(codepoint)}\t{analysis[codepoint]}') for codepoint in sorted(res['analysis']) if codepoint < int(0x20000) and not (int(0xE000) <= codepoint <= int(0xF8FF))]

# 1780 - 17D2 -> Khmer (1780–17FF) 114 codepoints
# 359E - 4D5F -> CJK Unified Ideographs Extension A (3400–4DBF)
# 60A5 - 9AA9 -> CJK Unified Ideographs (4E00–9FFF)
# FE50 - FE63 -> Small Form Variants (FE50–FE6F) 26

eLabSIP = read_codepoints_from_file('../eLabFTWNotoSIP-Regular.ttf.codepoints')

res = venn('eLabSIP', eLabSIP, 'analysis', res['analysis'], True)
[print(f'{codepoint:06X}\t{chr(codepoint)}\t{analysis[codepoint]}') for codepoint in sorted(res['analysis']) if codepoint >= int(0x20000) and not (int(0xE000) <= codepoint <= int(0xF8FF))]
# 5 missing but also not in noto

# 3400..4DBF; CJK Unified Ideographs Extension A
# 4E00..9FFF; CJK Unified Ideographs
cjkui = set([x for x in range(int(0x3400), int(0x4dbf)+1)] + [x for x in range(int(0x4e00), int(0x9fff)+1)])
res = venn('eLabFont', eLabFont, 'cjkui', cjkui, True)
#[print(f'U+{cp:06X}') for cp in sorted(res['cjkui'])]

res = venn('eLabSIP', eLabSIP, 'cjkui not in eLab', res['cjkui'], True)
[print(f'U+{cp:06X}') for cp in sorted(res['cjkui not in eLab']) if not (int(0x4db6) <= cp <= int(0x4dbf)) and not (int(0x9ff0) <= cp <= int(0x9fff)) ]
# 4db6-4dbf not in noto font
# 9ff0-9fff not in noto font
