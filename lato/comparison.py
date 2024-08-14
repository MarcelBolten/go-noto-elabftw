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
    for start, end in ranges:
        if start == end:
            print(f"{start:06X}")
        else:
            print(f"{start:06X}-{end:06X}, length: {end-start+1}")

lato = "eLabFTWNoto-Regular.ttf"
#lato = "NotoSans-Regular.ttf"
lato_codepoints = read_codepoints_from_file(lato + ".codepoints")

fonts = [
    "Lato-Regular_v2.ttf",
    "NotoSans-Regular.ttf",
    #"DejaVuSans.ttf",
    #"lato-regular.ttf",
    #"Sun-ExtA.ttf",
    #"NotoSansCJKsc-Regular.otf",
]

results = {}

for font in fonts:
    input_filename = "{}.codepoints".format(font)
    codepoints = read_codepoints_from_file(input_filename)
    results[font] = {}
    #print(font)

    intersection = lato_codepoints.intersection(codepoints)
    results[font]['Intersection'] = get_continuous_ranges(list(intersection))
    #print('\nIntersection: {}'.format(len(intersection)))
    #print_ranges(results[font]['Intersection'])

    missing = lato_codepoints - codepoints
    results[font]['Missing'] = get_continuous_ranges(list(missing))
    #print('\nMissing: {}'.format(len(missing)))
    #print_ranges(results[font]['Missing'])

    additional = codepoints - lato_codepoints
    results[font]['Additional'] = get_continuous_ranges(list(additional))
    print('\nAdditional: {}'.format(len(additional)))
    print_ranges(results[font]['Additional'])

    print("{} ( {} ( {} ) {} ) {}".format(
        lato,
        len(missing),
        len(intersection),
        len(additional),
        font
    ))
