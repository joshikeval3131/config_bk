#!/bin/bash


#  Create a neovim init file and copy paste the contentes there 
mkdir -p ~/.config/nvim/

cp ./init.vim ~/.config/nvim/

# Install Plug and Vundle Plugins 
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

# Install ctags 
sudo apt install exuberant-ctags
# Install fzf fuzzy finder 

sudo apt install fzf 

# RUN plug instsall and PluginInstall command on NVIM  
# This will install all plugins in nvim 

nvim +'PlugInstall --sync' +qa 

nvim +'PluginInstall' +qa
