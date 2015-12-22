#! /bin/sh
#DO NOT INCLUDE THIS FILE IN YOUR OWN SCRIPTS(Unless you only want them to be
#runnable in the kitchen. Instead just include

#This creates a list of whitespace separated pairs representing the files in the
#configured ROM search path($romdir). The output can be passed to dialog to
#create a ROM menu.
checkout_romdir(){
    c=0
    tmp=""
    for f in $romdir; do
        c=$((c+1))
        tmp= $c $f 
    done
    echo $tmp
}

#
#
