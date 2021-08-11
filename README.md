vimrc and plugins
=================

Oneline installation for manjaro:

    wget -O - https://raw.githubusercontent.com/TotalKrill/nvim/master/install-neovim.sh | bash

Intro
-----

This is my private nvim setting, it might be updated or it
might not. The settings are somewhat commented in the init.nvim

used mostly for rust development, so many rust components are assumed to be installed


Plugins used: See plug section of Init .nvim


Requires
--------

    neovim clang python-neovim python2-neovim cmake rust analyzer

Installation
------------

To get this:

    git clone --recurse-submodules https://github.com/TotalKrill/.nvim.git ~/.config/nvim

Then start neovim and run:

    :PlugInstall

You will need a neovim with python 2 enabled. For
archlinux or manjaro a 'python2-neovim' package is available

You need some rust components for this:

    :CocInstall coc-rust-analyzer

You also need rust-analyzer

    sudo pacman -S rust-analyzer

And rust source for cargo

    rustup component add rust-src



Settings
---------

This .vimrc will include the plugins airline, pathogen, Youcompleteme and fugitive as
well as lizard colortheme.

Furthermore it will contain some c-code specific things since I mostly use vim for
embedded programming, for instance it will add the current folder of the file opened
and all folders under it to the path for easy opening with :find and also has a
shortcut for switching between c header/source files for all folders in path. This might break
some peoples workflow.


