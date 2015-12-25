#! /bin/sh
#DO NOT INCLUDE THIS FILE IN YOUR OWN SCRIPTS(Unless you only want them to be
#runnable in the kitchen. Instead just include

#This creates a list of whitespace separated pairs representing the files in the
#configured ROM search path($SCULLERY_ROM_DIR). The output can be passed to dialog to
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

#This checks for the presence of a ROM's working folder in the $SCULLERY_ROM_DIR and
#checks if there is already a working directory associated with that ROM.
#Re-naming ROM files is the only way of changing the working folder name, when
#it needs to be done programmatically, make a backup, copy the backup to the
#new name, then reload it.
do_backup(){
    FOLDER="$1"
    FIND_WORKING=$(ls -d "$FOLDER.scullery")
    UT=$(date +%s)
    tar -cJf "$FIND_WORKING$UT.tar.xz" "$FIND_WORKING"  

}

#This takes a ROM from a file and places the files into the working directory.
#It determines what kind of file it is itself.
#
do_unpack(){
    COMPRESSED_FILE="$1"
    COMPRESSED_FILE_EXTENSION="${COMPRESSED_FILE##*.}"
    if [ COMPRESSED_FILE_EXTENSION = ".tar.xz" ]; then
        echo test
    fi
}