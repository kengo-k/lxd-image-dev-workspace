#!/bin/bash

#
# init asdf
#
echo ">>> install asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.2
. ~/.asdf/asdf.sh

# ghq
asdf plugin add ghq
asdf install ghq 1.4.1
asdf global ghq 1.4.1

# peco
asdf plugin add peco
asdf install peco 0.5.10
asdf global ghq 0.5.10
