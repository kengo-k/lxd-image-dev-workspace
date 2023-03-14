#!/bin/sh

# .zshrcがoh-my-zshによって置き換えられてしまうので退避しておく
mv ~/.zshrc ~/.zshrc.org

/tmp/init_zsh.sh

# oh-mu-zshが配置した.zshrcをリネームして退避したファイルを復元する
if [ -e ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.ohmyzsh.bk
fi
mv ~/.zshrc.org ~/.zshrc

/tmp/install_asdf.sh
sudo /tmp/install_docker.sh
