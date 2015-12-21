# android-scullery
A complete rewrite of Android Kitchen. It presents the same basic messages and
options, and in fact Scullery was written with Kitchen as a reference. It's goal
is to implement all the features in a way which is easy to package for a linux
distribution or use with a graphical interface. To that end, it presents
dialog/zenity menus by default, it can be passed parameters at the terminal, or
a frontend can be created to craft a command with the parameters and run it in
a shell.

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
            -e) Install
            "
        }