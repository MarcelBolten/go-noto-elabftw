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

# Read codepoints from a file with 'U+xxxxxx' format
def read_codepoints_from_file(filename):
    with open(filename, 'r', encoding='utf-8') as file:
        return [int(line.strip().replace('U+', ''), 16) for line in file if line.strip()]

# Write ranges to a file
def write_ranges_to_file(filename, ranges):
    with open(filename, 'w', encoding='utf-8') as file:
        for start, end in ranges:
            if start == end:
                file.write(f"{start:06X}\n")
            else:
                file.write(f"{start:06X}-{end:06X}, length: {end-start+1}\n")

# Example usage
fonts = [
    "lato-regular.ttf",
    "Lato-Regular_v2.ttf",
    "Sun-ExtA.ttf",
    "Sun-ExtB.ttf",
    "NotoSansCJKsc-Regular.otf",
    "DejaVuSans.ttf",
    "eLabFTWNoto-Regular.ttf"
]
for font in fonts:
  input_filename = "{}.codepoints".format(font)
  output_filename = "{}_ranges".format(input_filename[0:-1])
  codepoints = read_codepoints_from_file(input_filename)
  ranges = get_continuous_ranges(codepoints)
  write_ranges_to_file(output_filename, ranges)
