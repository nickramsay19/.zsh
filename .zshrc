# Title: .zsh/.zshrc
# Author: Nicholas Ramsay

# --- HOUSEKEEPING --- 
HISTFILE=${HOME}/.zsh/.zsh_history # change where the hisory file is located to the .zsh dir
#setopt AUTO_CD # move without using cd

# ignore duplicates in history
# only ignore duplictes not both which includes commands starting with spaces
export HISTCONTROL=ignoredups # for bash
setopt HIST_IGNORE_DUPS # for zsh

# --- ALIASES ---
# redefine commmon bash commands 
#alias ls="ls -Al --color=auto | cut -w -f 9"
alias ls="ls -A1L --color=auto" # much simpler way
alias mv="mv -i" # safe move to prevent overrides
alias rm="rm -d"
alias ps="ps -al"
# extra aliases
alias g="git"
alias python="python3.11"
alias res="source ${HOME}/.zsh/.zshrc"
alias vim="nvim"
# location shortcuts
alias pro="cd ~/Documents/Projects"
alias doc="cd ~/Documents"
alias des="cd ~/Desktop"
alias drop="cd ~/Dropbox/"
alias uni="cd ~/Documents/University/Y5S1"

# --- PERSONAL ALIASES ---
# UNSW HELPER UTILS
source ${HOME}/.zsh/.secrets.zsh # gitignored secrets
alias unsh="ssh ${UNSW_ZID}@login.cse.unsw.edu.au"
#alias sshunsw="op item get UNSW --fields label=password | " # 1Password shortcuts

# md - mkdir and cd into it
function md() {
  mkdir $1 && cd $1
}

# --- PLUGINS ---
# zsh-autosuggestions
#source ${HOME}/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#bindkey '<tab>' autosuggest-accept

# zsh-syntax-highlighting 
source ${HOME}/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-vi-mode - improves zsh's vim mode
#bindkey -v # disable default vim mode
#source ${HOME}/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh
# vi mode seems to bug out my terminal, so i am disabling it

# --- PROMPT STYLE --- 
# SETUP GIT INFO IN PROMPT
#autoload -Uz vcs_info # first we must load version control info
#precmd() { vcs_info }
#zstyle ':vcs_info:git:*' formats '[%b]' # format git
#setopt PROMPT_SUBST

# STYLE AND FORMAT PROMPT
autoload -U colors && colors # prompt colors
#PROMPT='${fg[white]}[${fg[yellow]}%T${fg[white]}] %~ > ${fg[bright_white]}'
PROMPT='%F{white}[%F{yellow}%T%F{white}] %~ > %F{bright_white}' 
#RPROMPT='$vcs_info_msg_0_ [$ZVM_MODE]'

# --- PATH ---
path+=('/Users/nickramsay/Documents/Projects/go-auto-wallpaper/bin') # automatic wallpaper changer
path+=('/Users/nickramsay/Documents/Projects/c-mac-display-macro/dist') # display configuration macro
path+=('/Users/nickramsay/Documents/Projects/c-math2400-utils/dist') # custom finite math utils
path+=('/Users/nickramsay/Documents/Projects/py_quickscript/bin') # quickscript
export PATH

# --- ENVIRONMENT VARIABLES
#export GIT_CONFIG=${HOME}/.config/git/gitconfig # custom GIT CONFIG location
export GOPATH=/usr/local/Cellar/go/1.8 # set go packages dir to inside where I have go installed
