#! /bin/sh
#KITCHEN={ "../android-kitchen/menu" "../android-kitchen/scripts/check_rom" "../android-kitchen/scripts/init_kitchen" }
#SCULLERY={ "./usr/bin/scullery" "./usr/lib/scullery/extract_rom" "./usr/lib/scullery/functions.sh" }
echo "            lines  words   chars"
WC_RESULTS_KITCHEN=$(cat "../android-kitchen/menu" "../android-kitchen/scripts/check_rom" "../android-kitchen/scripts/init_kitchen" "../android-kitchen/scripts/check_binaries" | wc)
WC_RESULTS_SCULLERY=$(cat "./usr/bin/scullery" "./usr/lib/scullery/extract_rom" "./usr/lib/scullery/functions.sh" | wc)
echo -n "kitchen " && echo " $WC_RESULTS_KITCHEN"
echo -n "scullery" && echo " $WC_RESULTS_SCULLERY"
KITCHEN_ARRAY=$(echo $WC_RESULTS_KITCHEN | tr " " "\n") && KLINES=$(cat "../android-kitchen/menu" "../android-kitchen/scripts/check_rom" "../android-kitchen/scripts/init_kitchen" "../android-kitchen/scripts/check_binaries" | wc -l)
SCULLERY_ARRAY=$(echo $WC_RESULTS_SCULLERY | tr " " "\n") && SLINES=$(cat "./usr/bin/scullery" "./usr/lib/scullery/extract_rom" "./usr/lib/scullery/functions.sh" | wc -l)
echo $(($KLINES-$SLINES))

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
