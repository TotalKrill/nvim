vimrc and plugins
=================

Intro
-----

This is my private vim setting, it might be updated or it
might not. I am not responsible for anything you destroy by using
my settings file.

Installation
------------
To get this:

    git clone --recursive git@github.com:TotalKrill/.vim.git

in home folder.

Remember to go into YouComplete me and compile with:

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

Settings:
---------

This .vimrc will include the plugins airline, pathogen, Youcompleteme and fugitive as
well as lizard colortheme.

Furthermore it will contain some c-code specific things since I mostly use vim for
embedded programming, for instance it will add the current folder of the file opened
and all folders under it to the path for easy opening with :find and also has a
shortcut for switching between c header/source files for all folders in path. This might break
some peoples workflow.


