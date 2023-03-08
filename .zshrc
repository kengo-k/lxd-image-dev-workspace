#
# setup zsh & oh-my-zsh
#
export ZSH=$HOME/.oh-my-zsh

if [ -e $ZSH/oh-my-zsh.sh ]; then
  #ZSH_THEME="agnoster"
  ZSH_THEME="robbyrussell"
  plugins=(git docker)
  source $ZSH/oh-my-zsh.sh
fi

if [ -d /path/to/directory ]; then
  source ~/.asdf/asdf.sh
fi

# setup peco-ghq
peco-src () {
  local repo=$(ghq list | peco --query "$LBUFFER")
  if [ -n "$repo" ]; then
    repo=$(ghq list --full-path --exact $repo)
    BUFFER="cd ${repo}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^g' peco-src
