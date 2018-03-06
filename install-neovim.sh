echo "Installing deps"
sudo pacman -S git neovim clang python-neovim python2-neovim cmake gcc
echo "Clone git repo"
git clone --recurse-submodules https://github.com/TotalKrill/.nvim.git ~/.config/nvim
echo "Use pluginstall to compile ycm and download plugins"
nvim -c ":PlugInstall" -c ":qa"
echo "if no errors, you can now run neovim with 'nvim'"
