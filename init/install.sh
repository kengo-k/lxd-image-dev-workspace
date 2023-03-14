#!/bin/sh

# .zshrcがoh-my-zshによって置き換えられてしまうので退避しておく
mv ~/.zshrc ~/.zshrc.org

./init_zsh.sh

# oh-mu-zshが配置した.zshrcをリネームして退避したファイルを復元する
if [ -e ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.ohmyzsh.bk
fi
mv ~/.zshrc.org ~/.zshrc

./install_asdf.sh
source ~/.asdf/asdf.sh

sudo ./install_docker.sh
