

autoload -Uz compinit; compinit
autoload -Uz bashcompinit; bashcompinit
source ~/.bash_profile
eval "$(nodenv init -)"
compdef _git stripe-git=git # this line specifically will fix git autocompletion

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


CFLAGS='-O2'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="refined"
# ZSH_THEME="zhann"

plugins=(aws brew docker emoji fzf git git-extras history history-substring-search iterm2 jsontools node npm macos ripgrep ruby ssh-agent terraform tmux tmuxinator yarn)

export GOPATH=$HOME/golang
export PATH="$GOPATH/bin:/usr/local/opt/go/libexec/bin:/usr/local/bin:/usr/local/heroku/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$PATH"


if [[ -a "$HOME/.privaterc" ]]; then
  source $HOME/.privaterc
fi

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim';
alias vim='nvim';

if [[ -a "$HOME/.bin/tmuxinator.zsh" ]]; then
  source $HOME/.bin/tmuxinator.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(nodenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"


export PATH="./node_modules/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
