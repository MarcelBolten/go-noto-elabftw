import sys
from collections import Counter

def combine_files(output_file, *input_files):
    combined_count = Counter()

    # Read each input file and update the combined character count
    print("Reading individual result files ...")
    for input_file in input_files:
        with open(input_file, 'r', encoding='utf-8') as file:
            for line in file:
                codepoint, char, frequency = line.strip().split('\t')
                frequency = int(frequency)
                combined_count[(codepoint, char)] += frequency

    # Write the combined result to the output file
    with open(output_file, 'w', encoding='utf-8') as output_file:
        for (codepoint, char), frequency in combined_count.most_common():
            output_file.write(f"{codepoint}\t{char}\t{frequency}\n")

    print(f"Combined character frequency analysis saved to {output_file.name}")

if __name__ == "__main__":
    # Check for correct number of arguments
    if len(sys.argv) < 3:
        print("Usage: python combine_results.py <output_file> <input_file1> <input_file2> ...")
        sys.exit(1)

    combine_files(sys.argv[1], *sys.argv[2:])
