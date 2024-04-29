#!/usr/bin/env bash
source common_steps.sh

# --- execution starts here ---
create_duployan_subset
create_math_subset
create_tibetan_subset
create_indosphere_subset
drop_vertical_tables NotoSerifDogra-Regular.ttf
drop_vertical_tables NotoSansNandinagari-Regular.ttf
drop_vertical_tables NotoSansMongolian-Regular.ttf
drop_vertical_tables NotoSansNushu-Regular.ttf
drop_vertical_tables NotoSerifTangut-Regular.ttf

declare -a fonts=(
    GoNotoAfricaMiddleEast
    GoNotoSouthAsia
    GoNotoAsiaHistorical
    GoNotoSouthEastAsia
    GoNotoEastAsia
    GoNotoEuropeAmericas
    GoNotoIndosphere
)

for font in "${fonts[@]}"; do
    name="$font.ttf"
    if [[ -e "$font.ttf" ]]; then
        echo "Not overwriting existing font $name."
        continue
    fi
    declare -n source_fonts="$font" # nameref to array in categories.sh
    echo "Generating font $name. Current time: $(date)."
    go_build "$name" "${source_fonts[@]}"
done

create_cjk_unihan_core
