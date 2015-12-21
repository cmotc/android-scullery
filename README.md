Android Scullery
================

A complete rewrite of Android Kitchen. It presents the same basic messages and
options, and in fact Scullery was written with Kitchen as a reference. It's goal
is to implement all the features in a way which is easy to package for a Linux
(GNU or otherwise) distribution or use with a graphical interface. To that end,
it presents dialog/zenity menus by default, it can be passed parameters at the
terminal, or a frontend can be created to craft a command with the parameters
and run it in a shell.

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

Equivalents Chart
-----------------
This is not a one-to-one recreation of the Android Kitchen, but where possible
equivalent folders and functions will be listed below.  

Script Cloning Checklist
------------------------

[Complete List](https://github.com/cmotc/android-scullery/blob/master/cloneme.list)

###Completed/In Progress
  * ./menu ~ ./usr/bin/scullery This script loads defaults, does argument
    parsing, and launches the tools.
  * ./scripts/check\_rom ~ ./usr/lib/extract\_rom Some of this script's
    functionality is also represented in libfunctions.sh.

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

Scullery API
------------
Functions for implementing plugins to the kitchen. To include these in your code
use:  

        . /usr/lib/scullery/libfunctions.sh  

note that this will not load your configuration file. That is included by the
scullery script itself and isn't necessary to load. A thin wrapper should be
possible to create around scripts created with these functions which allows you
to run it without running the scullery.
