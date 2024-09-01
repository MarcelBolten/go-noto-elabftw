#!/usr/bin/env bash
source scripts/common_steps.sh

# --- execution starts here ---
# eLabFTWNoto-Regular.ttf
create_cjk_subset
create_korean_hangul_full
create_japanese_kana_subset &
create_math_subset &
create_thai_subset &
create_coptic_subset &
get_noto_emoji_monochrome &
wait

echo "Generating eLabFTWNoto-Regular.ttf. Current time: $(date)."
go_build fonts/eLabFTWNoto-Regular.ttf "${eLabFTWNotoRegular[@]}" &

echo "Generating eLabFTWNoto-Bold.ttf. Current time: $(date)."
go_build fonts/eLabFTWNoto-Bold.ttf "${eLabFTWNotoBold[@]}" &

wait

# eLabFTWNotoSIP-Regular.ttf

create_cjk_sip_subset

echo "Generating eLabFTWNotoSIP-Regular.ttf. Current time: $(date)."
go_build fonts/eLabFTWNotoSIP-Regular.ttf "${eLabFTWNotoSIPRegular[@]}" &

echo "Generating eLabFTWNotoSIP-Bold.ttf. Current time: $(date)."
go_build fonts/eLabFTWNotoSIP-Bold.ttf "${eLabFTWNotoSIPBold[@]}" &

wait

echo "Generating GoNotoCurrentMono.ttf. Current time: $(date)."
go_build fonts/GoNotoCurrentMono.ttf "${GoNotoCurrentMono[@]}" &

echo "Generating GoNotoCurrentMonoBold.ttf. Current time: $(date)."
go_build fonts/GoNotoCurrentMonoBold.ttf "${GoNotoCurrentMonoBold[@]}" &

echo "Generating GoNotoCurrentItalic.ttf. Current time: $(date)."
go_build fonts/GoNotoCurrentItalic.ttf "${GoNotoCurrentItalic[@]}" &

echo "Generating GoNotoCurrentBoldItalic.ttf. Current time: $(date)."
go_build fonts/GoNotoCurrentBoldItalic.ttf "${GoNotoCurrentBoldItalic[@]}" &

wait

# GoNotoAncient.ttf

create_duployan_subset &
drop_vertical_tables NotoSerifDogra-Regular.ttf &
drop_vertical_tables NotoSansNandinagari-Regular.ttf &
drop_vertical_tables NotoSansNushu-Regular.ttf &
drop_vertical_tables NotoSerifTangut-Regular.ttf &
wait
echo "Generating GoNotoAncient.ttf. Current time: $(date)."
go_build fonts/GoNotoAncient.ttf "${GoNotoAncient[@]}"
