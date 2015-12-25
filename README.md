Android Scullery
================

A complete rewrite of Android Kitchen. It presents the same basic messages and
options, and in fact Scullery was written with Kitchen as a reference. It's goal
is to implement all the features in a way which is easy to package for a Linux
(GNU or otherwise) distribution or use with a graphical interface. To that end,
it presents dialog/zenity menus by default, it can be passed parameters at the
terminal, or a frontend can be created to craft a command with the parameters
and run it in a shell. This being written with Dash and is avoiding any
Bash-specific syntax, but it'll definitely run in Bash and probably run in
mksh, maybe some more shells. Whichever ones comply with the same basic
standards as Dash.

This isn't intended to reflect any criticism of the Android Kitchen itself as a
means to achieve it's goals. It's just that it has relatively limited
capabilities, hasn't been updated in over 2 years, and isn't packageable. I'm
not going to hassle @dsixda to make all the changes I want, so I'm just
rewriting it.

Usage
-----
While I'm still developing this framework, I'm just going to copy the show_help
function into the readme file whole.

        show_help(){
            echo "Welcome to Android Scullery! This is a fully re-written version of the
        Android Kitchen ROM customization tools. It's a GNU/Linux shell script written
        to target the Dash shell, but it should work with any shell. Since you're asking
        for help, I bet you want to know these parameters:
            -h || -?)
            -v) Run with verbose output.
            -d) Specify a working directory.
            -r) Specify a ROM directory where scullery will look for ROMs to modify.
            -f) Specify a ROM file/folder to modify.
            -l) Specify a path to look for the library of scripts.
            -p) Specify a plugin directory to look for custom scripts in.
            -i) Specify a style of interface to present when options are required.
                term || cli : Run with terminal interface.
                diag || wiz : Run with wizard-like GUI.
                gui : Run with frontend.
            -e) Install dependencies(Debian only for now)
            "
        }

Goals
-----
Run in lots of ways, including being callable in a one-line command and being
installed in a system's $PATH.  

Provide a better way of developing plugins and extensions to the Kitchen.  

Provide shell scripts with pre-built functions for querying and manipulating
common Android ROM related needs.  

Changes from Android Kitchen
-----------------------------------------

  * Working folders now end in .scullery rather than starting in WORKING_.
  * No Bash-specific syntax
  * Use Dialog or the equivalent available on the system to design and present
    menus when running interactively.
  * Can be installed system-wide and configured by a file in /etc/ or in the
    user's home directory.
  * Better backups and saves(compressed backups, configurable rotation, better
    naming, automatic naming)
  * Usable as library in other shell scripts(Automatic/schedulable builds for
    easy updates)

Equivalents Chart
-----------------
This is not a one-to-one recreation of the Android Kitchen, but where possible
equivalent folders and functions will be listed below.  

Script Cloning Checklist
------------------------

[Complete List](https://github.com/cmotc/android-scullery/blob/master/cloneme.list)

###Completed/In Progress
  * ./menu ~ ./usr/bin/scullery This script loads defaults, does argument
    parsing, and launches the tools. (Done)
  * ./scripts/check\_rom ~ ./usr/lib/extract\_rom Some of this script's
    functionality is also represented in functions.sh. Mostly done.
    * ./scripts/make\_backup\_working ~ This is subsumed into functions.sh, and
      controlled by flows defined in the make\_backup\_working function in the
      ./usr/lib/scullery/extract\_rom script.
    * ./scripts/choose\_rom ~ By the time you get to this point, choose\_rom is
      actually just an arrangement of primitives you already have for reading
      the contents of folders and handling arguments. So again, it's in
      functions.sh and controlled by extract\_rom.
      * ./scripts/*\_files\_to\_working\_folder ~ Each of these scripts is
      represented by a function in the functions.sh script.
  * ./scripts/do\_root ~ This is one of the closest to the original kitchen
    scripts. Pre-rooting a packaged ROM is pretty straightforward. Not started
    yet.
  * ./scripts/add\_busybox ~ This one is also close to the original kitchen 
    scripts. Pre-rooting a packaged ROM is pretty straightforward. Not started
    yet.
  * ./scripts/disable\_sounds ~ This one has been rewritten to present
    consistent dialog menus, and to provide more options than the original like
    replacing the original sounds with automatic conversion. Not started yet.
  * ./scripts/do\_zipalign ~ Zipalign the applications used in the ROM to
    optimize performance. Not started yet.
  * ./scripts/change\_wipe ~ Change the wipe status of the phone. Not started
    yet.
  * ./scripts/change\_rom\_name ~ Change the name of the ROM. Not started yet.
  * ./scripts/show\_rom\_info ~ Show the status of the ROM in the working
    directory. Not started yet.
  * ./scripts/menu\_advanced ~ Show advanced menu, which includes things like
    editing build.prop and running user-added plugins. Not started yet.
  * ./scripts/menu\_legacy ~ deprecated. Instead it's been replaced with a set
    of menus which guides the user through the ROM's files in order to detect
    enough information to construce a device tree for a Source ROM. Not started
    yet.
  * ./scripts/build\_rom ~ Compiles the ROM in the selected working directory.
    Not started yet.
  * ./scripts/about ~ Roughly corresponds to the new help option, which also
    displays version info. Not started yet.
  * ./scripts/init\_kitchen ~ deprecated. Instead it's been replaced with an
    option that the settings and status of the Scullery. Not started yet.

###Not Necessary/Not Targeted
I don't care to bundle tools to target Windows. I also don't care to make it
work on Mac's, necessarily, but it probably will without much effort. So the
following scripts have had their functionality significantly changed.

  * ./scripts/init\_kitchen ~ This script mostly checks for the proper
    configuration of the necessary dependencies for running the other scripts.
    This is mostly subsumed by allowing the dependencies to be covered by the
    package manager, and what's left is dealt with in functions.sh.
  * ./scripts/check\_binaries ~ This script mostly checks for the proper
    configuration of the necessary dependencies for running the other scripts.
    This is mostly subsumed by allowing the dependencies to be covered by the
    package manager, and what's left is dealt with in functions.sh.
  * ./scripts/check\_multiple\_working ~ This script is obsolete. It will be
    replaced with a menu which allows you to simply select the desired working
    folder.
  * scripts/press\_enter ~ This is not necessary anymore, since we're using
    dialogs and not reads.

Scullery API
------------
Functions for implementing plugins to the kitchen. To include these in your code
use: 

        #!/bin/sh
        export quiet=1
        . /usr/bin/scullery

note that this will not load your configuration file. That is included by the
scullery script itself and isn't necessary to load. A thin wrapper should be
possible to create around scripts created with these functions which allows you
to run it without running the scullery.
