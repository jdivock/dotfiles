if [[ -a "$HOME/.privaterc" ]]; then
  source $HOME/.privaterc
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="refined"

plugins=(jsontools aws git git-extras osx docker brew brew-cask node npm tmux vi-mode)

# User configuration
export GOPATH=$HOME/golang
export PATH="./node_modules/.bin:$GOPATH/bin:/usr/local/opt/go/libexec/bin:/usr/local/bin:/usr/local/heroku/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$PATH"

source $ZSH/oh-my-zsh.sh

export EDITOR='vim';
alias vim='nvim';

if [[ -a "$HOME/.bin/tmuxinator.zsh" ]]; then
  source $HOME/.bin/tmuxinator.zsh
fi

eval "$(rbenv init -)"
eval "$(nodenv init -)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.rvm/bin:/usr/local/sbin:$PATH"
