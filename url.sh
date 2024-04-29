#!/usr/bin/env bash
set -eu

# URL:s taken from https://notofonts.github.io/

# Associative array (key-value pair)
# Sorted alphabetically as per keys

# Those fonts NOT directly under notofonts.github.io/fonts/
# are not yet migrated fully (apparently) and hence development build URLs are used below

# Problematic/unavailable URLs are marked TODO
declare -A font_urls=(
    ["NotoMusic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoMusic/hinted/ttf/NotoMusic-Regular.ttf
    ["NotoNaskhArabic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoNaskhArabic/hinted/ttf/NotoNaskhArabic-Regular.ttf
    ["NotoNastaliqUrdu-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoNastaliqUrdu/hinted/ttf/NotoNastaliqUrdu-Regular.ttf
    ["NotoSans-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSans/hinted/ttf/NotoSans-Bold.ttf
    ["NotoSans-BoldItalic.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSans/hinted/ttf/NotoSans-BoldItalic.ttf
    ["NotoSans-Italic.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSans/hinted/ttf/NotoSans-Italic.ttf
    ["NotoSans-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSans/hinted/ttf/NotoSans-Regular.ttf
    ["NotoSansAdlam-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansAdlam/hinted/ttf/NotoSansAdlam-Bold.ttf
    ["NotoSansAdlam-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansAdlam/hinted/ttf/NotoSansAdlam-Regular.ttf
    ["NotoSansAnatolianHieroglyphs-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansAnatolianHieroglyphs/hinted/ttf/NotoSansAnatolianHieroglyphs-Regular.ttf
    ["NotoSansArabic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansArabic/hinted/ttf/NotoSansArabic-Regular.ttf
    ["NotoSansArabic-SemiBold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansArabic/hinted/ttf/NotoSansArabic-SemiBold.ttf
    ["NotoSansArmenian-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansArmenian/hinted/ttf/NotoSansArmenian-Bold.ttf
    ["NotoSansArmenian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansArmenian/hinted/ttf/NotoSansArmenian-Regular.ttf
    ["NotoSansAvestan-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansAvestan/hinted/ttf/NotoSansAvestan-Regular.ttf
    ["NotoSansBalinese-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBalinese/hinted/ttf/NotoSansBalinese-Bold.ttf
    ["NotoSansBalinese-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBalinese/hinted/ttf/NotoSansBalinese-Regular.ttf
    ["NotoSansBamum-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBamum/hinted/ttf/NotoSansBamum-Regular.ttf
    ["NotoSansBassaVah-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBassaVah/hinted/ttf/NotoSansBassaVah-Bold.ttf
    ["NotoSansBassaVah-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBassaVah/hinted/ttf/NotoSansBassaVah-Regular.ttf
    ["NotoSansBatak-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBatak/hinted/ttf/NotoSansBatak-Regular.ttf
    ["NotoSansBengali-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBengali/hinted/ttf/NotoSansBengali-Bold.ttf
    ["NotoSansBengali-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBengali/hinted/ttf/NotoSansBengali-Regular.ttf
    ["NotoSansBhaiksuki-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBhaiksuki/hinted/ttf/NotoSansBhaiksuki-Regular.ttf
    ["NotoSansBrahmi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBrahmi/hinted/ttf/NotoSansBrahmi-Regular.ttf
    ["NotoSansBuginese-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBuginese/hinted/ttf/NotoSansBuginese-Regular.ttf
    ["NotoSansBuhid-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansBuhid/hinted/ttf/NotoSansBuhid-Regular.ttf
    ["NotoSansCanadianAboriginal-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansCanadianAboriginal/hinted/ttf/NotoSansCanadianAboriginal-Regular.ttf
    ["NotoSansCarian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansCarian/hinted/ttf/NotoSansCarian-Regular.ttf
    ["NotoSansCaucasianAlbanian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansCaucasianAlbanian/hinted/ttf/NotoSansCaucasianAlbanian-Regular.ttf
    ["NotoSansChakma-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansChakma/hinted/ttf/NotoSansChakma-Regular.ttf
    ["NotoSansCham-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansCham/hinted/ttf/NotoSansCham-Bold.ttf
    ["NotoSansCham-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansCham/hinted/ttf/NotoSansCham-Regular.ttf
    ["NotoSansCherokee-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansCherokee/hinted/ttf/NotoSansCherokee-Bold.ttf
    ["NotoSansCherokee-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansCherokee/hinted/ttf/NotoSansCherokee-Regular.ttf
    ["NotoSansChorasmian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansChorasmian/hinted/ttf/NotoSansChorasmian-Regular.ttf
    ["NotoSansCoptic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansCoptic/hinted/ttf/NotoSansCoptic-Regular.ttf
    ["NotoSansCuneiform-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansCuneiform/hinted/ttf/NotoSansCuneiform-Regular.ttf
    ["NotoSansCypriot-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansCypriot/hinted/ttf/NotoSansCypriot-Regular.ttf
    ["NotoSansCyproMinoan-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansCyproMinoan/hinted/ttf/NotoSansCyproMinoan-Regular.ttf
    ["NotoSansDeseret-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansDeseret/hinted/ttf/NotoSansDeseret-Regular.ttf
    ["NotoSansDevanagari-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansDevanagari/hinted/ttf/NotoSansDevanagari-Bold.ttf
    ["NotoSansDevanagari-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansDevanagari/hinted/ttf/NotoSansDevanagari-Regular.ttf
    ["NotoSansDuployan-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansDuployan/unhinted/ttf/NotoSansDuployan-Regular.ttf # TODO: Cannot merge 'CFF ' table
    ["NotoSansEgyptianHieroglyphs-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansEgyptianHieroglyphs/hinted/ttf/NotoSansEgyptianHieroglyphs-Regular.ttf
    ["NotoSansElbasan-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansElbasan/hinted/ttf/NotoSansElbasan-Regular.ttf
    ["NotoSansElymaic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansElymaic/hinted/ttf/NotoSansElymaic-Regular.ttf
    ["NotoSansEthiopic-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansEthiopic/hinted/ttf/NotoSansEthiopic-Bold.ttf
    ["NotoSansEthiopic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansEthiopic/hinted/ttf/NotoSansEthiopic-Regular.ttf
    ["NotoSansGeorgian-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansGeorgian/hinted/ttf/NotoSansGeorgian-Bold.ttf
    ["NotoSansGeorgian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansGeorgian/hinted/ttf/NotoSansGeorgian-Regular.ttf
    ["NotoSansGlagolitic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansGlagolitic/hinted/ttf/NotoSansGlagolitic-Regular.ttf
    ["NotoSansGothic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansGothic/hinted/ttf/NotoSansGothic-Regular.ttf
    ["NotoSansGrantha-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansGrantha/hinted/ttf/NotoSansGrantha-Regular.ttf
    ["NotoSansGujarati-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansGujarati/hinted/ttf/NotoSansGujarati-Bold.ttf
    ["NotoSansGujarati-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansGujarati/hinted/ttf/NotoSansGujarati-Regular.ttf
    ["NotoSansGunjalaGondi-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansGunjalaGondi/hinted/ttf/NotoSansGunjalaGondi-Bold.ttf
    ["NotoSansGunjalaGondi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansGunjalaGondi/hinted/ttf/NotoSansGunjalaGondi-Regular.ttf
    ["NotoSansGurmukhi-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansGurmukhi/hinted/ttf/NotoSansGurmukhi-Bold.ttf
    ["NotoSansGurmukhi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansGurmukhi/hinted/ttf/NotoSansGurmukhi-Regular.ttf
    ["NotoSansHanifiRohingya-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansHanifiRohingya/hinted/ttf/NotoSansHanifiRohingya-Bold.ttf
    ["NotoSansHanifiRohingya-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansHanifiRohingya/hinted/ttf/NotoSansHanifiRohingya-Regular.ttf
    ["NotoSansHanunoo-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansHanunoo/hinted/ttf/NotoSansHanunoo-Regular.ttf
    ["NotoSansHatran-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansHatran/hinted/ttf/NotoSansHatran-Regular.ttf
    ["NotoSansHebrew-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansHebrew/hinted/ttf/NotoSansHebrew-Bold.ttf
    ["NotoSansHebrew-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansHebrew/hinted/ttf/NotoSansHebrew-Regular.ttf
    ["NotoSansImperialAramaic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansImperialAramaic/hinted/ttf/NotoSansImperialAramaic-Regular.ttf
    ["NotoSansIndicSiyaqNumbers-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansIndicSiyaqNumbers/hinted/ttf/NotoSansIndicSiyaqNumbers-Regular.ttf
    ["NotoSansInscriptionalPahlavi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansInscriptionalPahlavi/hinted/ttf/NotoSansInscriptionalPahlavi-Regular.ttf
    ["NotoSansInscriptionalParthian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansInscriptionalParthian/hinted/ttf/NotoSansInscriptionalParthian-Regular.ttf
    ["NotoSansJavanese-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansJavanese/hinted/ttf/NotoSansJavanese-Bold.ttf
    ["NotoSansJavanese-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansJavanese/hinted/ttf/NotoSansJavanese-Regular.ttf
    ["NotoSansKaithi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansKaithi/hinted/ttf/NotoSansKaithi-Regular.ttf
    ["NotoSansKannada-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansKannada/hinted/ttf/NotoSansKannada-Bold.ttf
    ["NotoSansKannada-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansKannada/hinted/ttf/NotoSansKannada-Regular.ttf
    ["NotoSansKawi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansKawi/hinted/ttf/NotoSansKawi-Regular.ttf
    ["NotoSansKayahLi-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansKayahLi/hinted/ttf/NotoSansKayahLi-Bold.ttf
    ["NotoSansKayahLi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansKayahLi/hinted/ttf/NotoSansKayahLi-Regular.ttf
    ["NotoSansKharoshthi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansKharoshthi/hinted/ttf/NotoSansKharoshthi-Regular.ttf
    ["NotoSansKhmer-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansKhmer/hinted/ttf/NotoSansKhmer-Bold.ttf
    ["NotoSansKhmer-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansKhmer/hinted/ttf/NotoSansKhmer-Regular.ttf
    ["NotoSansKhudawadi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansKhudawadi/hinted/ttf/NotoSansKhudawadi-Regular.ttf
    ["NotoSansLao-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansLao/hinted/ttf/NotoSansLao-Bold.ttf
    ["NotoSansLao-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansLao/hinted/ttf/NotoSansLao-Regular.ttf
    ["NotoSansLepcha-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansLepcha/hinted/ttf/NotoSansLepcha-Regular.ttf
    ["NotoSansLimbu-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansLimbu/hinted/ttf/NotoSansLimbu-Regular.ttf
    ["NotoSansLinearA-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansLinearA/hinted/ttf/NotoSansLinearA-Regular.ttf
    ["NotoSansLinearB-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansLinearB/hinted/ttf/NotoSansLinearB-Regular.ttf
    ["NotoSansLisu-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansLisu/hinted/ttf/NotoSansLisu-Bold.ttf
    ["NotoSansLisu-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansLisu/hinted/ttf/NotoSansLisu-Regular.ttf
    ["NotoSansLycian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansLycian/hinted/ttf/NotoSansLycian-Regular.ttf
    ["NotoSansLydian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansLydian/hinted/ttf/NotoSansLydian-Regular.ttf
    ["NotoSansMahajani-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMahajani/hinted/ttf/NotoSansMahajani-Regular.ttf
    ["NotoSansMalayalam-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMalayalam/hinted/ttf/NotoSansMalayalam-Bold.ttf
    ["NotoSansMalayalam-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMalayalam/hinted/ttf/NotoSansMalayalam-Regular.ttf
    ["NotoSansMandaic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMandaic/hinted/ttf/NotoSansMandaic-Regular.ttf
    ["NotoSansManichaean-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansManichaean/hinted/ttf/NotoSansManichaean-Regular.ttf
    ["NotoSansMarchen-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMarchen/hinted/ttf/NotoSansMarchen-Regular.ttf
    ["NotoSansMasaramGondi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMasaramGondi/hinted/ttf/NotoSansMasaramGondi-Regular.ttf
    ["NotoSansMath-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMath/hinted/ttf/NotoSansMath-Regular.ttf
    ["NotoSansMayanNumerals-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMayanNumerals/hinted/ttf/NotoSansMayanNumerals-Regular.ttf
    ["NotoSansMedefaidrin-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMedefaidrin/hinted/ttf/NotoSansMedefaidrin-Bold.ttf
    ["NotoSansMedefaidrin-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMedefaidrin/hinted/ttf/NotoSansMedefaidrin-Regular.ttf
    ["NotoSansMeeteiMayek-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMeeteiMayek/hinted/ttf/NotoSansMeeteiMayek-Bold.ttf
    ["NotoSansMeeteiMayek-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMeeteiMayek/hinted/ttf/NotoSansMeeteiMayek-Regular.ttf
    ["NotoSansMendeKikakui-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMendeKikakui/hinted/ttf/NotoSansMendeKikakui-Regular.ttf
    ["NotoSansMeroitic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMeroitic/hinted/ttf/NotoSansMeroitic-Regular.ttf
    ["NotoSansMiao-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMiao/hinted/ttf/NotoSansMiao-Regular.ttf
    ["NotoSansModi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansModi/hinted/ttf/NotoSansModi-Regular.ttf
    ["NotoSansMongolian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMongolian/hinted/ttf/NotoSansMongolian-Regular.ttf
    ["NotoSansMono-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMono/hinted/ttf/NotoSansMono-Bold.ttf
    ["NotoSansMono-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMono/hinted/ttf/NotoSansMono-Regular.ttf
    ["NotoSansMro-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMro/hinted/ttf/NotoSansMro-Regular.ttf
    ["NotoSansMultani-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMultani/hinted/ttf/NotoSansMultani-Regular.ttf
    ["NotoSansMyanmar-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMyanmar/hinted/ttf/NotoSansMyanmar-Bold.ttf
    ["NotoSansMyanmar-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansMyanmar/hinted/ttf/NotoSansMyanmar-Regular.ttf
    ["NotoSansNabataean-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansNabataean/hinted/ttf/NotoSansNabataean-Regular.ttf
    ["NotoSansNagMundari-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansNagMundari/hinted/ttf/NotoSansNagMundari-Regular.ttf
    ["NotoSansNandinagari-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansNandinagari/hinted/ttf/NotoSansNandinagari-Regular.ttf
    ["NotoSansNewa-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansNewa/hinted/ttf/NotoSansNewa-Regular.ttf
    ["NotoSansNewTaiLue-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansNewTaiLue/hinted/ttf/NotoSansNewTaiLue-Bold.ttf
    ["NotoSansNewTaiLue-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansNewTaiLue/hinted/ttf/NotoSansNewTaiLue-Regular.ttf
    ["NotoSansNKo-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansNKo/hinted/ttf/NotoSansNKo-Regular.ttf
    ["NotoSansNKoUnjoined-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansNKoUnjoined/hinted/ttf/NotoSansNKoUnjoined-Bold.ttf
    ["NotoSansNushu-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansNushu/hinted/ttf/NotoSansNushu-Regular.ttf
    ["NotoSansOgham-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOgham/hinted/ttf/NotoSansOgham-Regular.ttf
    ["NotoSansOlChiki-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOlChiki/hinted/ttf/NotoSansOlChiki-Bold.ttf
    ["NotoSansOlChiki-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOlChiki/hinted/ttf/NotoSansOlChiki-Regular.ttf
    ["NotoSansOldHungarian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOldHungarian/hinted/ttf/NotoSansOldHungarian-Regular.ttf
    ["NotoSansOldItalic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOldItalic/hinted/ttf/NotoSansOldItalic-Regular.ttf
    ["NotoSansOldNorthArabian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOldNorthArabian/hinted/ttf/NotoSansOldNorthArabian-Regular.ttf
    ["NotoSansOldPermic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOldPermic/hinted/ttf/NotoSansOldPermic-Regular.ttf
    ["NotoSansOldPersian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOldPersian/hinted/ttf/NotoSansOldPersian-Regular.ttf
    ["NotoSansOldSogdian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOldSogdian/hinted/ttf/NotoSansOldSogdian-Regular.ttf
    ["NotoSansOldSouthArabian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOldSouthArabian/hinted/ttf/NotoSansOldSouthArabian-Regular.ttf
    ["NotoSansOldTurkic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOldTurkic/hinted/ttf/NotoSansOldTurkic-Regular.ttf
    ["NotoSansOriya-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOriya/hinted/ttf/NotoSansOriya-Bold.ttf
    ["NotoSansOriya-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOriya/hinted/ttf/NotoSansOriya-Regular.ttf
    ["NotoSansOsage-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOsage/hinted/ttf/NotoSansOsage-Regular.ttf
    ["NotoSansOsmanya-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansOsmanya/hinted/ttf/NotoSansOsmanya-Regular.ttf
    ["NotoSansPahawhHmong-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansPahawhHmong/hinted/ttf/NotoSansPahawhHmong-Regular.ttf
    ["NotoSansPalmyrene-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansPalmyrene/hinted/ttf/NotoSansPalmyrene-Regular.ttf
    ["NotoSansPauCinHau-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansPauCinHau/hinted/ttf/NotoSansPauCinHau-Regular.ttf
    ["NotoSansPhagsPa-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansPhagsPa/hinted/ttf/NotoSansPhagsPa-Regular.ttf
    ["NotoSansPhoenician-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansPhoenician/hinted/ttf/NotoSansPhoenician-Regular.ttf
    ["NotoSansPsalterPahlavi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansPsalterPahlavi/hinted/ttf/NotoSansPsalterPahlavi-Regular.ttf
    ["NotoSansRejang-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansRejang/hinted/ttf/NotoSansRejang-Regular.ttf
    ["NotoSansRunic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansRunic/hinted/ttf/NotoSansRunic-Regular.ttf
    ["NotoSansSamaritan-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSamaritan/hinted/ttf/NotoSansSamaritan-Regular.ttf
    ["NotoSansSaurashtra-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSaurashtra/hinted/ttf/NotoSansSaurashtra-Regular.ttf
    ["NotoSansSharada-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSharada/hinted/ttf/NotoSansSharada-Regular.ttf
    ["NotoSansShavian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansShavian/hinted/ttf/NotoSansShavian-Regular.ttf
    ["NotoSansSiddham-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSiddham/hinted/ttf/NotoSansSiddham-Regular.ttf
    ["NotoSansSignWriting-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSignWriting/hinted/ttf/NotoSansSignWriting-Regular.ttf
    ["NotoSansSinhala-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSinhala/hinted/ttf/NotoSansSinhala-Bold.ttf
    ["NotoSansSinhala-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSinhala/hinted/ttf/NotoSansSinhala-Regular.ttf
    ["NotoSansSogdian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSogdian/hinted/ttf/NotoSansSogdian-Regular.ttf
    ["NotoSansSoraSompeng-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSoraSompeng/hinted/ttf/NotoSansSoraSompeng-Regular.ttf
    ["NotoSansSoyombo-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSoyombo/hinted/ttf/NotoSansSoyombo-Regular.ttf
    ["NotoSansSundanese-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSundanese/hinted/ttf/NotoSansSundanese-Bold.ttf
    ["NotoSansSundanese-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSundanese/hinted/ttf/NotoSansSundanese-Regular.ttf
    ["NotoSansSylotiNagri-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSylotiNagri/hinted/ttf/NotoSansSylotiNagri-Regular.ttf
    ["NotoSansSymbols-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSymbols/hinted/ttf/NotoSansSymbols-Bold.ttf
    ["NotoSansSymbols-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSymbols/hinted/ttf/NotoSansSymbols-Regular.ttf
    ["NotoSansSymbols2-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSymbols2/hinted/ttf/NotoSansSymbols2-Regular.ttf
    ["NotoSansSyriac-Black.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSyriac/hinted/ttf/NotoSansSyriac-Black.ttf
    ["NotoSansSyriac-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansSyriac/hinted/ttf/NotoSansSyriac-Regular.ttf
    ["NotoSansTagalog-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTagalog/hinted/ttf/NotoSansTagalog-Regular.ttf
    ["NotoSansTagbanwa-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTagbanwa/hinted/ttf/NotoSansTagbanwa-Regular.ttf
    ["NotoSansTaiLe-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTaiLe/hinted/ttf/NotoSansTaiLe-Regular.ttf
    ["NotoSansTaiTham-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTaiTham/hinted/ttf/NotoSansTaiTham-Bold.ttf
    ["NotoSansTaiTham-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTaiTham/hinted/ttf/NotoSansTaiTham-Regular.ttf
    ["NotoSansTaiViet-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTaiViet/hinted/ttf/NotoSansTaiViet-Regular.ttf
    ["NotoSansTakri-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTakri/hinted/ttf/NotoSansTakri-Regular.ttf
    ["NotoSansTamil-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTamil/hinted/ttf/NotoSansTamil-Bold.ttf
    ["NotoSansTamil-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTamil/hinted/ttf/NotoSansTamil-Regular.ttf
    ["NotoSansTangsa-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTangsa/hinted/ttf/NotoSansTangsa-Bold.ttf
    ["NotoSansTangsa-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTangsa/hinted/ttf/NotoSansTangsa-Regular.ttf
    ["NotoSansTelugu-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTelugu/hinted/ttf/NotoSansTelugu-Bold.ttf
    ["NotoSansTelugu-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTelugu/hinted/ttf/NotoSansTelugu-Regular.ttf
    ["NotoSansThaana-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansThaana/hinted/ttf/NotoSansThaana-Bold.ttf
    ["NotoSansThaana-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansThaana/hinted/ttf/NotoSansThaana-Regular.ttf
    ["NotoSansThai-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansThai/hinted/ttf/NotoSansThai-Bold.ttf
    ["NotoSansThai-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansThai/hinted/ttf/NotoSansThai-Regular.ttf
    ["NotoSansTifinagh-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTifinagh/hinted/ttf/NotoSansTifinagh-Regular.ttf
    ["NotoSansTirhuta-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansTirhuta/hinted/ttf/NotoSansTirhuta-Regular.ttf
    ["NotoSansUgaritic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansUgaritic/hinted/ttf/NotoSansUgaritic-Regular.ttf
    ["NotoSansVai-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansVai/hinted/ttf/NotoSansVai-Regular.ttf
    ["NotoSansVithkuqi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansVithkuqi/hinted/ttf/NotoSansVithkuqi-Regular.ttf
    ["NotoSansWancho-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansWancho/hinted/ttf/NotoSansWancho-Regular.ttf
    ["NotoSansWarangCiti-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansWarangCiti/hinted/ttf/NotoSansWarangCiti-Regular.ttf
    ["NotoSansYi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansYi/hinted/ttf/NotoSansYi-Regular.ttf
    ["NotoSansZanabazarSquare-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSansZanabazarSquare/hinted/ttf/NotoSansZanabazarSquare-Regular.ttf
    ["NotoSerif-BoldItalic.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerif/hinted/ttf/NotoSerif-BoldItalic.ttf
    ["NotoSerif-Italic.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerif/hinted/ttf/NotoSerif-Italic.ttf
    ["NotoSerif-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerif/hinted/ttf/NotoSerif-Regular.ttf
    ["NotoSerifAhom-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifAhom/hinted/ttf/NotoSerifAhom-Regular.ttf
    ["NotoSerifArmenian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifArmenian/hinted/ttf/NotoSerifArmenian-Regular.ttf
    ["NotoSerifBalinese-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifBalinese/hinted/ttf/NotoSerifBalinese-Regular.ttf
    ["NotoSerifBengali-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifBengali/hinted/ttf/NotoSerifBengali-Regular.ttf
    ["NotoSerifDevanagari-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifDevanagari/hinted/ttf/NotoSerifDevanagari-Regular.ttf
    ["NotoSerifDivesAkuru-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifDivesAkuru/hinted/ttf/NotoSerifDivesAkuru-Regular.ttf
    ["NotoSerifDogra-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifDogra/hinted/ttf/NotoSerifDogra-Regular.ttf
    ["NotoSerifEthiopic-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifEthiopic/hinted/ttf/NotoSerifEthiopic-Regular.ttf
    ["NotoSerifGeorgian-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifGeorgian/hinted/ttf/NotoSerifGeorgian-Regular.ttf
    ["NotoSerifGrantha-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifGrantha/hinted/ttf/NotoSerifGrantha-Regular.ttf
    ["NotoSerifGujarati-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifGujarati/hinted/ttf/NotoSerifGujarati-Regular.ttf
    ["NotoSerifGurmukhi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifGurmukhi/hinted/ttf/NotoSerifGurmukhi-Regular.ttf
    ["NotoSerifHebrew-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifHebrew/hinted/ttf/NotoSerifHebrew-Regular.ttf
    ["NotoSerifKannada-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifKannada/hinted/ttf/NotoSerifKannada-Regular.ttf
    ["NotoSerifKhitanSmallScript-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifKhitanSmallScript/hinted/ttf/NotoSerifKhitanSmallScript-Regular.ttf
    ["NotoSerifKhmer-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifKhmer/hinted/ttf/NotoSerifKhmer-Regular.ttf
    ["NotoSerifKhojki-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifKhojki/hinted/ttf/NotoSerifKhojki-Regular.ttf
    ["NotoSerifLao-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifLao/hinted/ttf/NotoSerifLao-Regular.ttf
    ["NotoSerifMakasar-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifMakasar/hinted/ttf/NotoSerifMakasar-Regular.ttf
    ["NotoSerifMalayalam-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifMalayalam/hinted/ttf/NotoSerifMalayalam-Regular.ttf
    ["NotoSerifMyanmar-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifMyanmar/hinted/ttf/NotoSerifMyanmar-Regular.ttf
    ["NotoSerifNPHmong-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifNPHmong/hinted/ttf/NotoSerifNPHmong-Regular.ttf
    ["NotoSerifOldUyghur-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifOldUyghur/hinted/ttf/NotoSerifOldUyghur-Regular.ttf
    ["NotoSerifOriya-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifOriya/hinted/ttf/NotoSerifOriya-Regular.ttf
    ["NotoSerifOttomanSiyaq-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifOttomanSiyaq/hinted/ttf/NotoSerifOttomanSiyaq-Regular.ttf
    ["NotoSerifSinhala-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifSinhala/hinted/ttf/NotoSerifSinhala-Regular.ttf
    ["NotoSerifTamil-BoldItalic.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifTamil/hinted/ttf/NotoSerifTamil-BoldItalic.ttf
    ["NotoSerifTamil-Italic.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifTamil/hinted/ttf/NotoSerifTamil-Italic.ttf
    ["NotoSerifTamil-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifTamil/hinted/ttf/NotoSerifTamil-Regular.ttf
    ["NotoSerifTangut-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifTangut/hinted/ttf/NotoSerifTangut-Regular.ttf
    ["NotoSerifTelugu-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifTelugu/hinted/ttf/NotoSerifTelugu-Regular.ttf
    ["NotoSerifThai-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifThai/hinted/ttf/NotoSerifThai-Regular.ttf
    ["NotoSerifTibetan-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifTibetan/hinted/ttf/NotoSerifTibetan-Bold.ttf
    ["NotoSerifTibetan-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifTibetan/hinted/ttf/NotoSerifTibetan-Regular.ttf
    ["NotoSerifToto-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifToto/hinted/ttf/NotoSerifToto-Bold.ttf
    ["NotoSerifToto-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifToto/hinted/ttf/NotoSerifToto-Regular.ttf
    ["NotoSerifVithkuqi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifVithkuqi/hinted/ttf/NotoSerifVithkuqi-Regular.ttf
    ["NotoSerifYezidi-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifYezidi/hinted/ttf/NotoSerifYezidi-Bold.ttf
    ["NotoSerifYezidi-Regular.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoSerifYezidi/hinted/ttf/NotoSerifYezidi-Regular.ttf
    ["NotoTraditionalNushu-Bold.ttf"]=https://cdn.jsdelivr.net/gh/notofonts/notofonts.github.io/fonts/NotoTraditionalNushu/hinted/ttf/NotoTraditionalNushu-Bold.ttf
)

# report broken links
# echo "Checking for broken links..."
# for font in "${font_urls[@]}"; do
#   if ! wget --spider "$font" 2>/dev/null; then
#     echo "File does not exist: $font"
#   fi
#   echo -n '.'
# done
# echo ''

# download all fonts
# echo "Downloading fonts..."
# for font in "${font_urls[@]}"; do
#   echo "${font##*/}"
#   if wget --spider "$font" 2>/dev/null && [ ! -f "${font##*/}" ]; then
#     wget "$font"
#   fi
# done
