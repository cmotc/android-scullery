#! /bin/sh
#KITCHEN={ "../android-kitchen/menu" "../android-kitchen/scripts/check_rom" "../android-kitchen/scripts/init_kitchen" "../android-kitchen/tools/formats.txt" }
#SCULLERY={ "./usr/bin/scullery" "./usr/lib/scullery/extract_rom" "./usr/lib/scullery/functions.sh" "./usr/lib/scullery/formats.txt" }
echo "            lines  words   chars"
echo -n "kitchen " && cat "../android-kitchen/menu" "../android-kitchen/scripts/check_rom" "../android-kitchen/scripts/init_kitchen" "../android-kitchen/scripts/check_binaries" "../android-kitchen/tools/formats.txt" | wc
echo -n "scullery" && cat "./usr/bin/scullery" "./usr/lib/scullery/extract_rom" "./usr/lib/scullery/functions.sh" "./usr/lib/scullery/formats.txt" | wc

#shlint "../android-kitchen/menu" "../android-kitchen/scripts/check_rom" "../android-kitchen/scripts/init_kitchen"
shlint "./usr/bin/scullery" "./usr/lib/scullery/extract_rom" "./usr/lib/scullery/functions.sh"
