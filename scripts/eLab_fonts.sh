#!/usr/bin/env bash
source scripts/common_steps.sh

# --- execution starts here ---
# eLabFTWNotoA-{Regular,Bold}.ttf
create_cjk_subset
create_korean_hangul_full
create_japanese_kana_subset &
create_math_subset &
create_thai_subset &
create_coptic_subset &
get_noto_emoji_monochrome &
wait

echo "Generating eLabFTWNotoA-Regular.ttf. Current time: $(date)."
go_build fonts/eLabFTWNotoA-Regular.ttf "${eLabFTWNotoARegular[@]}" &

echo "Generating eLabFTWNotoA-Bold.ttf. Current time: $(date)."
go_build fonts/eLabFTWNotoA-Bold.ttf "${eLabFTWNotoABold[@]}" &

wait

# eLabFTWNotoB-{Regular,Bold}.ttf
create_cjk_partB_subset

echo "Generating eLabFTWNotoB-Regular.ttf. Current time: $(date)."
go_build fonts/eLabFTWNotoB-Regular.ttf "${eLabFTWNotoBRegular[@]}" &

echo "Generating eLabFTWNotoB-Bold.ttf. Current time: $(date)."
go_build fonts/eLabFTWNotoB-Bold.ttf "${eLabFTWNotoBBold[@]}" &

wait

echo "Generating eLabFTWNotoMono.ttf. Current time: $(date)."
go_build fonts/eLabFTWNotoMono.ttf "${eLabFTWNotoMono[@]}" &

echo "Generating eLabFTWNotoMonoBold.ttf. Current time: $(date)."
go_build fonts/eLabFTWNotoMonoBold.ttf "${eLabFTWNotoMonoBold[@]}" &

echo "Generating eLabFTWNotoItalic.ttf. Current time: $(date)."
go_build fonts/eLabFTWNotoItalic.ttf "${eLabFTWNotoItalic[@]}" &

echo "Generating eLabFTWNotoBoldItalic.ttf. Current time: $(date)."
go_build fonts/eLabFTWNotoBoldItalic.ttf "${eLabFTWNotoBoldItalic[@]}" &

wait

# eLabFTWNotoAncient.ttf

create_duployan_subset &
drop_vertical_tables NotoSerifDogra-Regular.ttf &
drop_vertical_tables NotoSansNandinagari-Regular.ttf &
drop_vertical_tables NotoSansNushu-Regular.ttf &
drop_vertical_tables NotoSerifTangut-Regular.ttf &
wait
echo "Generating eLabFTWNotoAncient.ttf. Current time: $(date)."
go_build fonts/eLabFTWNotoAncient.ttf "${eLabFTWNotoAncient[@]}"
