Contributing to the Scullery
============================
At it's most basic, both Android Kitchen and Android Scullery are just launchers
for other shell scipts, which makes it easy to extend their functionality with,
you guessed it, shell scripts. Scullery tries to take advantage of this by
primarily being a layer of functionality which sets up an environment for
locating, setting up, and launching shell scripts automatically. To that end,
though, there are some simple stylistic rules and arbitrary values that need to
be agreed upon by the contributors the code.

This is more for me than for anyone else, but only things that meet these
minumum standards will be considered for inclusion in this branch of the
scullery.

Guidelines:
-----------
Don't use Bash or Bashism's. Nothing against Bash per se, just that using Bash
specific syntax can cause problems on distributions where Bash isn't the default
interactive shell. 

Organize your code by giving global variables pseudo-namespaces such as
SCULLERY_ in the case of the main tools or a consistent, unique all-caps
nickname in the case of plugins. export when the variables need to be shared
between scripts.

        Example:
        SCULLERY_APP_TITLE="Android Scullery"

Organize your code by encapsulating all your control flow into functions with
clear names. In the case of main tools, call the tools by adding them to the
menu, sourcing them into the scullery, and calling a function or series of
functions.

        Example:
        MENU_OPTION=$(dialog --title "$SCULLERY_APP_TITLE" --menu 14 80 12 \
          1 "Setup Working Folder from ROM" \
          <Other Index> <Other Options> \
          3>&1 1>&2 2>&3 3>&-)
        ...
        case $MENU_OPTION in
          1) . $SCULLERY_FUNCTIONS_DIR/extract_rom && run_extract_rom
          <Other Index>) ./$SCULLERY_FUNCTIONS_DIR/<Other Script> && <Function in the other script>

In the case of plugins, the scullery\_plugin\_main function will be called
automatically by default and changing other files is not necessary.

Plugins:
--------
Adding scripts to Scullery can be done in 2 ways. First, you can create 
"Plugins" which go in the user's configured plugin directory, which is 
"$HOME/.config/scullery/plugins" by default, or it can be set in a configuration
file, or it can be set with a terminal argument. Plugins are automatically 
detected and added to the Advanced Options menu.

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