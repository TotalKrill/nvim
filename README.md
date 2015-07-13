vimrc and plugins
=================

Intro
-----

This is my private nvim setting, it might be updated or it
might not. The settings are somewhat commented in the .vimrc file

I am not responsible for anything you destroy by using
my settings file.

Installation
------------
To get this:

    git clone --recursive git@github.com:TotalKrill/.vim.git

in home folder.

Remember to go into the YouCompleteme folder and compile with:

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

Depends on `astyle, ctags and ofcourse neovim`

You will need a neovim with python 2 enabled. For
archlinux a 'python2-neovim' package is available in the AUR


Usage
-----
For generating tags:

    ctags --languages=C -R

Then usage:

    Ctrl + ]  - Goto definition
    Ctrl + T  - Jump back
    Ctrl + W, Ctrl + ]  - Open in horisontal split

Header/Source toggle (anywhere in path):

    F4 - Will switch to a header/source file of current file

Jump to filename under cursor:

    gf - Jump to filename under cursor

Open file with name in subfolders:

    :find name

Format file using bsd standards:

    gggqG - format entire file
    gq    - Format command, use movement to show whereto

Using doxygentoolkit:

    :Dox        -   Will create template for functions, cursor must be at function.
    :DoxLic     -   Will create license header
    :DoxAuthor  -   Will create author line

Settings
---------

This .vimrc will include the plugins airline, pathogen, Youcompleteme and fugitive as
well as lizard colortheme.

Furthermore it will contain some c-code specific things since I mostly use vim for
embedded programming, for instance it will add the current folder of the file opened
and all folders under it to the path for easy opening with :find and also has a
shortcut for switching between c header/source files for all folders in path. This might break
some peoples workflow.


