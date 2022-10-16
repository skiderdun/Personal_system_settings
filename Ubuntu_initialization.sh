#!/bin/bash/sh

echo "We'll setup NeoVim first"

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
cd ~/
mkdir ~/.config/

cp -r ~/Personal_system_settings/.bashrc ~/

cp -r ~/Personal_system_settings/nvim ~/.config/

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

nvim --headless -S "~/.config/nvim/plugins.lua" -c "qa!"
nvim --headless -c "PackerSync" -c "qa!"
nvim --headless -S "~/.config/nvim/init.lua" -c "qa!"

echo "NeoVim setup complete"

echo "\n Now We'll make sure you have your compilers sorted"

sudo apt install gcc

sudo apt install make

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source "$HOME/.cargo/env"
