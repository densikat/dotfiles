        #!/bin/bash

        rm -rf ~/.bashrc ~/.gitignore ~/.vimrc ~/.vim
        stow -vSt ~ bash
        stow -vSt ~ vim

        rm -f ~/.gitignore
        echo "tags" > ~/.gitignore
        git config --global core.excludesFile '~/.gitignore'

