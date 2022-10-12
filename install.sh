#!/user/bin/sh

# Install stow
echo 'Installing stow...'
sudo apt install -y stow

# Install vim
echo 'Installing vim...'
sudo apt install -y vim

if ! $(grep 'set -o vi' ~/.bashrc)
then
    echo 'set -o vi' >> ~/.bashrc
fi

stow --restow --target=$HOME vim

# Install tmux
echo 'Installing tmux...'
sudo apt install -y tmux

# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# TODO: Automatically load plugins

stow --restow --target=$HOME tmux
