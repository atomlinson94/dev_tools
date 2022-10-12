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
if [ ! -d "$HOME/.tmux/plugins/tpm/" ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins
fi
