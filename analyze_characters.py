import sys
from collections import Counter

def analyze_characters(input_file, output_file):
    # read input file
    print(f"Loading content of {input_file} ...")
    char_count = Counter()
    with open(input_file, 'r', encoding='utf-8') as file:
        for line in file:
            char_count.update(line)

    print(f"Writing character frequency analysis to {output_file}")
    # Write result (unicode codepoint, character, and frequency) to the output file
    with open(output_file, 'w', encoding='utf-8') as output_file:
        for char, frequency in char_count.most_common():
            # We don't care about Basic Latin (0-7F) and Latin-1 Supplement (80-FF)
            if ord(char) < 16**2:
                continue
            codepoint = f"U+{ord(char):06X}"
            if not char.isprintable():
                char = codepoint
            output_file.write(f"{codepoint}\t{char}\t{frequency}\n")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python analyze_characters.py <input_file> <output_file>")
        sys.exit(1)

    analyze_characters(sys.argv[1], sys.argv[2])
