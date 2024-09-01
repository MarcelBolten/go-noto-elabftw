#!/usr/bin/env bash

baseUrl="https://hanspub.org/journal/paperinformation?paperid="

max=89999
delta=500
let "min = $max + 1 - $delta"
for ((id=max; id>=min; id--)); do
    echo "Getting data from $baseUrl$id ..."
    w3m -dump "$baseUrl$id" >> "hanspub_dump_idrange_$min-$max.txt"
    if [ "$id" -ne "$min" ]; then
        echo -e "\n\n\n" >> "hanspub_dump_idrange_$min-$max.txt"
        # random_sleep_time=$(echo "scale=1; 1 + $(shuf -i 0-10 -n 1) / 10" | bc)
        random_sleep_time=$(echo "scale=1; 0.1 + $(shuf -i 0-5 -n 1) / 10" | bc)
        echo "Sleeping $random_sleep_time sec..."
        sleep $random_sleep_time
    fi
done

python ../scripts/analyze_characters.py "./hanspub_dump_idrange_$min-$max.txt" "./$min-$max.tsv"
