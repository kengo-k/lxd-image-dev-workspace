#!/bin/sh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#
# init asdf
#
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.2

# ghq
asdf plugin add ghq
asdf install ghq 1.4.1
asdf global ghq 1.4.1

# peco
asdf plugin add peco
asdf install peco 0.5.10
asdf global ghq 0.5.10
