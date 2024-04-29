#!/usr/bin/env bash
source common_steps.sh

# --- execution starts here ---
download_tools()

# GoNotoCurrentRegular.ttf
create_cjk_subset &
create_duployan_subset &
create_japanese_kana_subset &
create_korean_hangul_subset_and_full &
#create_math_subset
create_tibetan_subset &
wait

# declare GoNotoKurrentRegular and GoNotoKurrentBold categories
#declare_go_noto_kurrent_categories

drop_vertical_tables NotoSansMongolian-Regular.ttf &
drop_vertical_tables NotoSansNushu-Regular.ttf &
drop_vertical_tables NotoTraditionalNushu-Bold.ttf &
wait

echo "Generating GoNotoCurrent-Regular1.ttf. Current time: $(date)."
go_build GoNotoCurrent-Regular1.ttf "${GoNotoCurrentRegular1[@]}" &

echo "Generating GoNotoCurrent-Regular2.ttf. Current time: $(date)."
go_build GoNotoCurrent-Regular2.ttf "${GoNotoCurrentRegular2[@]}" &

echo "Generating GoNotoCurrent-Bold1.ttf. Current time: $(date)."
go_build GoNotoCurrent-Bold1.ttf "${GoNotoCurrentBold1[@]}" &

echo "Generating GoNotoCurrent-Bold2.ttf. Current time: $(date)."
go_build GoNotoCurrent-Bold2.ttf "${GoNotoCurrentBold2[@]}" &

wait

echo "Generating GoNotoCurrentMono.ttf. Current time: $(date)."
go_build GoNotoCurrentMono.ttf "${GoNotoCurrentMono[@]}" &

echo "Generating GoNotoCurrentMonoBold.ttf. Current time: $(date)."
go_build GoNotoCurrentMonoBold.ttf "${GoNotoCurrentMonoBold[@]}" &

echo "Generating GoNotoCurrentItalic.ttf. Current time: $(date)."
go_build GoNotoCurrentItalic.ttf "${GoNotoCurrentItalic[@]}" &

echo "Generating GoNotoCurrentBoldItalic.ttf. Current time: $(date)."
go_build GoNotoCurrentBoldItalic.ttf "${GoNotoCurrentBoldItalic[@]}" &

wait

# Korean but no Symbols, Math, Music
#echo "Generating GoNotoKurrent-Regular.ttf. Current time: $(date)."
#go_build GoNotoKurrent-Regular.ttf "${GoNotoKurrentRegular[@]}"

# Korean but no Symbols, Math, Music
#echo "Generating GoNotoKurrent-Bold.ttf. Current time: $(date)."
#go_build GoNotoKurrent-Bold.ttf "${GoNotoKurrentBold[@]}"

# GoNotoAncient.ttf
drop_vertical_tables NotoSerifDogra-Regular.ttf &
drop_vertical_tables NotoSansNandinagari-Regular.ttf &
drop_vertical_tables NotoSerifTangut-Regular.ttf &
wait
echo "Generating GoNotoAncient.ttf. Current time: $(date)."
go_build GoNotoAncient.ttf "${GoNotoAncient[@]}"

# GoNotoCurrentSerif.ttf
#echo "Generating GoNotoCurrentSerif.ttf. Current time: $(date)."
#go_build GoNotoCurrentSerif.ttf "${GoNotoCurrentSerif[@]}"

# GoNotoCurrentSerifItalic.ttf
#echo "Generating GoNotoCurrentSerifItalic.ttf. Current time: $(date)."
#go_build GoNotoCurrentSerifItalic.ttf "${GoNotoCurrentSerifItalic[@]}"

# GoNotoCurrentSerifBoldItalic.ttf
#echo "Generating GoNotoCurrentSerifBoldItalic.ttf. Current time: $(date)."
#go_build GoNotoCurrentSerifBoldItalic.ttf "${GoNotoCurrentSerifBoldItalic[@]}"

# GoNotoAncientSerif.ttf
#echo "Generating GoNotoAncientSerif.ttf. Current time: $(date)."
#go_build GoNotoAncientSerif.ttf "${GoNotoAncientSerif[@]}"

create_cjk_unihan_core
