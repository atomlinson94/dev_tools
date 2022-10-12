#!/user/bin/sh

# TODO: This script could probably use some work...

# Update and upgrade packages
echo "Update and upgrade packages..."
sudo apt update && sudo apt upgrade

# Install stow
echo "Install stow..."
sudo apt install -y stow

# Install vim
echo "Install vim..."
sudo apt install -y vim

stow --restow --target=$HOME vim

if ! $(grep 'alias v="vim"' ~/.bashrc)
then
    echo 'alias v="vim"' >> ~/.bashrc
fi

# Enable editing shell commands with vi
if ! $(grep "set -o vi" ~/.bashrc)
then
    echo "set -o vi" >> ~/.bashrc
fi

# Install tmux
echo "Install tmux..."
sudo apt install -y tmux

stow --restow --target=$HOME tmux

# If TPM is not installed, download it and install plugins
if ! -d "$HOME/.tmux/plugins/tpm/"
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins
fi

# Install neovim
echo "Install neovim..."

local_nvim_pkg_path = $HOME/Downloads/nvim-linux64.db

wget -O local_nvim_pkg_path https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb

sudo dpkg -i local_nvim_pkg_path && rm local_nvim_pkg_path

if ! $(grep 'alias nv="XDG_DATA_HOME=~/.local/share XDG_CONFIG_HOME=~/.config nvim"' ~/.bashrc)
then
    echo 'alias nv="XDG_DATA_HOME=~/.local/share XDG_CONFIG_HOME=~/.config nvim"' >> ~/.bashrc
fi

# Reload .bashrc
echo "Reload .bashrc..."
source $HOME/.bashrc
