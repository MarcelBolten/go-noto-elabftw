#!/bin/bash -e

# Use this script to see if Google has introduced new upstream fonts
# which we have not yet packaged.

url="notofonts.github.io"
# Use w3m text browser to capture all lines between "Scripts" and "Noto Dashboard" (exclusive)
all_scripts=$(w3m -dump "$url" | awk '/Scripts/{flag=1; next} /Noto Dashboard/{flag=0} flag')

# Convert multi-line string to array (each line is new member)
readarray -t scripts <<<"$all_scripts"

for script in "${scripts[@]}"; do
    # strip spaces, tabs, etc. and apostrophe (N' Ko script) from "$script" before grepping
    if ! grep -iq "${script//[[:blank:]\']}" categories.sh; then
        echo "$script from upstream Noto fonts not packaged yet"
    fi
done

echo "Latin, Greek, Cyrillic is NotoSans"
echo "Old Hungarian Ui might be deprecated, see https://github.com/notofonts/old-hungarian-ui/issues/11"
