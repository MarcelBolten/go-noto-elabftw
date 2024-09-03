def read_code_blocks():
    with open('cache/Blocks.txt') as blocks_file:
        blocks = {}
        for line in blocks_file:
            if line.strip() and not line.startswith('#'):
                coderange, name = line.strip().split(';')
                low, high = coderange.split('..')
                blocks[(int(low, 16), int(high, 16))] = name.strip()
        return blocks

# Read codepoints from a file with 'U+xxxxxx' format
def read_codepoints_from_file(filename):
    with open(filename, 'r', encoding='utf-8') as file:
        return {int(line.strip().replace('U+', ''), 16) for line in file if line.strip()}

def get_continuous_ranges(codepoints):
    if not codepoints:
        return []

    codepoints.sort()
    ranges = []
    start = prev = codepoints[0]

    for codepoint in codepoints[1:]:
        if codepoint == prev + 1:
            prev = codepoint
        else:
            ranges.append((start, prev))
            start = prev = codepoint

    ranges.append((start, prev))
    return ranges

def print_ranges(ranges):
    code_blocks = read_code_blocks()
    current_block = (0, 0)
    block_cache = ''
    new_block = True
    for start, end in ranges:
        if end > current_block[1]:
            new_block = True
        if new_block:
            for block_limits, block_name in code_blocks.items():
                if start >= block_limits[0] and start <= block_limits[1]:
                    current_block = block_limits
                    block_cache += f"\n# {block_name}\n"
                    break
            new_block = False
        if start == end:
            block_cache += f"{start:06X}\n"
        else:
            block_cache += f"{start:06X}-{end:06X}, length: {end-start+1}\n"
    print(block_cache.strip())

lato = "fonts/eLabFTWNotoA-Regular.ttf"
#lato = "NotoSans-Regular.ttf"
lato_codepoints = read_codepoints_from_file(lato + ".codepoints")

fonts = [
    #"scripts/lato/Lato-Regular_v2.ttf",
    #"NotoSans-Regular.ttf",
    "scripts/lato/DejaVuSans.ttf",
    #"Sun-ExtA.ttf",
    #"NotoSansCJKsc-Regular.otf",
]

results = {}

for font in fonts:
    input_filename = "{}.codepoints".format(font)
    codepoints = read_codepoints_from_file(input_filename)
    results[font] = {}

    intersection = lato_codepoints.intersection(codepoints)
    results[font]['Intersection'] = get_continuous_ranges(list(intersection))

    missing = lato_codepoints - codepoints
    results[font]['Missing'] = get_continuous_ranges(list(missing))

    additional = codepoints - lato_codepoints
    results[font]['Additional'] = get_continuous_ranges(list(additional))

    print("# {} ( {} ( {} ) {} ) {}".format(
        lato,
        len(missing),
        len(intersection),
        len(additional),
        font
    ))

    #print('\nIntersection: {}'.format(len(intersection)))
    #print_ranges(results[font]['Intersection'])

    #print('\nMissing: {}'.format(len(missing)))
    #print_ranges(results[font]['Missing'])

    print('# {} additional chars in {}'.format(len(additional), font))
    print_ranges(results[font]['Additional'])
