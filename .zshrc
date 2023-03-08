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
