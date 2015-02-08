# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# Current iterm theme = ATOM
ZSH_THEME="robbyrussell"

alias aws="ssh -i ~/.ssh/aws.pem ec2-user@ec2-54-204-22-61.compute-1.amazonaws.com"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
#function git_prompt_info() {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
#}

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(tmux git brew brew-cask aws)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:$PATH:/Users/jdivock/.rvm/gems/ruby-1.9.3-p545/bin:/Users/jdivock/.rvm/gems/ruby-1.9.3-p545@global/bin:/Users/jdivock/.rvm/rubies/ruby-1.9.3-p545/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/jdivock/.rvm/bin"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
# export MANPATH="/usr/local/man:$MANPATH"

# docker settings
export DOCKER_CERT_PATH=/Users/jdivock/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'
export TERM=xterm-256color
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

setopt AUTO_CD

# NVM stuff, to hold node 10 and 11
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# ALIASES
alias tmux="tmux -2"

# alias tree="tree -I node_modules"
alias ep="cd ~/Projects/Sonic/EchoPark/EchoPark.Website"
alias apeshit="cd ~/Projects/ApeShitFuckJacked"

alias ep-sass="grunt --inetDir=/Volumes/Website"
alias ep-webpack="webpack -wc --output-path /Volumes/Website/bundles"

source $HOME/.zshrc_keys

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
