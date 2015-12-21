#! /bin/sh
#KITCHEN={ "../android-kitchen/menu" "../android-kitchen/scripts/check_rom" "../android-kitchen/scripts/init_kitchen" }
#SCULLERY={ "./usr/bin/scullery" "./usr/lib/scullery/extract_rom" "./usr/lib/scullery/functions.sh" }
echo "            lines  words   chars"
echo -n "kitchen " && cat "../android-kitchen/menu" "../android-kitchen/scripts/check_rom" "../android-kitchen/scripts/init_kitchen" "../android-kitchen/scripts/check_binaries" | wc
echo -n "scullery" && cat "./usr/bin/scullery" "./usr/lib/scullery/extract_rom" "./usr/lib/scullery/functions.sh" | wc

KITCHLINT=$(shlint "../android-kitchen/menu" "../android-kitchen/scripts/check_rom" "../android-kitchen/scripts/init_kitchen" "../android-kitchen/scripts/check_binaries" \
            3>&1 1>&2 2>&3 3>&-)
echo "
Linting currently cloned Android Kitchen scripts

$KITCHLINT
"
[ "$KITCHLINT" = "" ] && echo "test1"
SCULLINT=$(shlint "./usr/bin/scullery" "./usr/lib/scullery/extract_rom" "./usr/lib/scullery/functions.sh" \
            3>&1 1>&2 2>&3 3>&-)
echo "
Linting current Android Scullery scripts

$SCULLINT
"
[ "$SCULLINT" = "" ]&& echo "Static analysis complete, shlint found no errors or bashisms in Scullery"
