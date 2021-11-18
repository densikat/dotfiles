        #!/bin/bash

        rm -rf ~/.bashrc ~/.gitignore ~/.vimrc ~/.vim ~/.alacritty.yml ~/.config/kitty ~/.config/tmuxinator ~/.emacs.d ~/.config/nvim
        stow -vSt ~ bash
        stow -vSt ~ vim
        stow -vSt ~ alacritty
        stow -vSt ~ kitty
        stow -vSt ~ tmuxinator
        stow -vSt ~ emacs
        stow -vSt ~ nvim

        rm -f ~/.gitignore
        echo "tags" > ~/.gitignore
        git config --global core.excludesFile '~/.gitignore'

