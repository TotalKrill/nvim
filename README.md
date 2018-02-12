vimrc and plugins
=================

Intro
-----

This is my private nvim setting, it might be updated or it
might not. The settings are somewhat commented in the .vimrc file

I am not responsible for anything you destroy by using
my settings file. I usually use this for c/c++ development.
There is some auto stuff inserted to new c/c++ files, if you fork, change this
to fit your setup.

Plugins used:

- NERDTree       ( filetree plugin 'ctrl+n' for toggle )
- YouCompleteMe  ( Must have for vim, code completion and more)
- AirLine        ( status bar, also have themes)
- bufkill        ( allows closing of a buffer, leaving windows untouched ':BW')
- vim-plug       ( plugin loader and installer ':PlugInstall' will download and fix all plugins)
- Fugitive       ( git wrapper)
- vim-commenter  ( use 'gc' to comment stuff)
- DoxygenToolkit ( Basic doxygen stuff for adding comments )

Requires
--------

neovim clang python-neovim python2-neovim

Installation
------------

To get this:

    git clone --recurse-submodules https://github.com/TotalKrill/.nvim.git ~/.config/nvim

Then start neovim and run:

    :PlugInstall

You will need a neovim with python 2 enabled. For
archlinux or manjaro a 'python2-neovim' package is available


Usage
-----
Then usage:

    Ctrl + ]  - Use YouCompleteMes Goto
    Ctrl + O  - Jump back
    Ctrl + I  - Jump forward

    Ctrl + W, Ctrl + ]  - Open in horisontal split

To open files with NERDTree use 'o' instead of 'Enter'.
much more convenient

Header/Source toggle (anywhere in path, not perfect):

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


