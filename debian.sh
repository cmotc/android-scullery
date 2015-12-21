#! /bin/sh
# Configure your paths and filenames
SOURCEBINPATH=.
SOURCEBIN=scullery
SOURCECFG="scullery.rc"
SOURCEDOC=README.md
LIBFOLDER=scullery
DEBFOLDER=android-scullery
DEBVERSION=$(date +%Y%m%d)

cd $DEBFOLDER 

git pull origin master

DEBFOLDERNAME="../$DEBFOLDER-$DEBVERSION"

# Create your scripts source dir
mkdir $DEBFOLDERNAME

# Copy your script to the source dir
cp $SOURCEBINPATH $DEBFOLDERNAME -R
cd $DEBFOLDERNAME

# Create the packaging skeleton (debian/*)
dh_make -s --indep --createorig 

mkdir -p debian/tmp
cp * debian/tmp -Rv

echo "export version=$DEBVERSION" >> debian/tmp/etc/scullery.rc
echo "export workdir=\$HOME/Projects/Android/Scullery" >> debian/tmp/etc/scullery.rc
# Remove make calls
grep -v makefile debian/rules > debian/rules.new 
mv debian/rules.new debian/rules 

# debian/install must contain the list of scripts to install 
# as well as the target directory
echo usr/bin/$SOURCEBIN usr/bin > debian/install 
for f in usr/lib/scullery/*; do
    echo usr/lib/$LIBFOLDER/$f usr/lib/$LIBFOLDER >> debian/install 
done
echo etc/$SOURCECFG etc >> debian/install 
echo $SOURCEDOC usr/share/doc/$DEBFOLDER >> debian/install

echo "Source: $DEBFOLDER
Section: unknown
Priority: optional
Maintainer: cmotc <cmotc@openmailbox.org>
Build-Depends: debhelper (>= 9)
Standards-Version: 3.9.5
Homepage: https://www.github.com/cmotc/android-scullery
#Vcs-Git: git@github.com:cmotc/android-scullery
#Vcs-Browser: https://www.github.com/cmotc/android-scullery

Package: $DEBFOLDER
Architecture: all
Depends: abootimg, android-tools-adb, android-tools-fastboot, android-tools-fsutils, heimdall-flash, unyaffs, \${misc:Depends}
Description: A tool for customizing Android ROMs.
 ." > debian/control 

# Remove the example files
rm debian/*.ex
rm debian/*.EX

# Build the package.
# You  will get a lot of warnings and ../somescripts_0.1-1_i386.deb
debuild -us -uc > ../log 
