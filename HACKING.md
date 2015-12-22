Contributing to the Scullery
============================

Plugins:
--------
At it's most basic, both Android Kitchen and Android Scullery are just launchers
for other shell scipts, which makes it easy to extend their functionality with,
you guessed it, shell scripts. Adding scripts to Scullery can be done in 2 ways.
First, you can create "Plugins" which go in the user's configured plugin
directory, which is "$HOME/.config/scullery/plugins" by default, or it can be
set in a configuration file, or it can be set with a terminal argument. Plugins
are automatically detected and added to the Advanced Options menu.

###Using Scullery as a library(Quiet Mode)
note: Verbose and Quiet mode are not mutually exclusive in this program. Quiet
mode just keeps it from running the menus. Verbose mode makes it print
additional output.

        #!/bin/sh
        export quiet=1
        . /usr/bin/scullery

###Running Scullery non-interactively.
When Scullery has been loaded as a library, running a plugin from it's own
directory will make it work with the defaults set in the configuration file.

###Converting Plugins to /usr/lib/scullery/* scripts
This is essentially the process of removing the library script from the plugin,
adding

        . /usr/lib/scullery/functions.sh

to the script file, moving it into /usr/lib/scullery/, and adding it to either
the Default Menu or the Advanced Menu.

###Converting /usr/lib/scullery/* scripts to Plugins for non-interactive use.
This process may be useful to run Scullery functions independently of the
menu system itself, perhaps with a cron job or something.

Filing Issues
-------------

Honestly, you can probably just copy and paste the output of the terminal you
ran it in if you find a bug or need me to fix something. It's just shell
scripts. Not magic.