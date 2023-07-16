# Title: .zsh/.zshrc
# Author: Nicholas Ramsay

# global default profile
source "$HOME/.profile"

# --- HOUSEKEEPING --- 
CASE_SENSITIVE="false"
#setopt AUTO_CD # move without using cd
HISTFILE=${HOME}/.cache/zsh_history
export HISTCONTROL=ignoredups # for bash
setopt HIST_IGNORE_DUPS # for zsh

# --- ENVIRONMENT VARIABLES ---
export SHELL="/bin/zsh"
export MANPAGER="nvim -c 'set ft=man' -"
export GIT_CONFIG_GLOBAL="$HOME/.config/git/gitconfig"
export MYVIMRC="$HOME/.config/vim/.vimrc"
#export VIMINIT=" let \$MYVIMRC=\"$HOME/.config/vim/vimrc\" | source \$MYVIMRC" # put vimrc in .config
export GOPATH=/usr/local/Cellar/go/1.8 # set go packages dir to inside where I have go installed
export STACK_XDG=true

# --- ALIASES ---
export CFG="$HOME/.config"
export DOC="$HOME/Documents"
export PRO="$DOC/Projects"
export DES="$HOME/Desktop"
export DRP="$HOME/Dropbox"

alias ls="ls -A1L --color=auto" 
#alias ls="ls -AHl --color=auto | cut -d$' ' -f 13-"
alias mv="mv -i" # safe move to prevent overrides
alias rm="rm -d" # allow remove empty dirs

alias py="python3.11"
alias res="source $ZDOTDIR/.zshrc"
alias vim="nvim"
alias pa="ps -al"

# location shortcuts
alias doc="cd $DOC"
alias pro="cd $PRO"
alias des="cd $DES"
alias drop="cd $DRP"

# clipboard shortcuts
alias cc="pbcopy" # note: replaces "cc" for clang
alias pp="pbpaste" # note: replaces "pp" tool

# git shortcuts
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gch="git checkout"
alias git-shuffle="git checkout main && git merge dev && git push -u origin main && git checkout dev" # do the git shuffle!

# unsw helper utils
export UNI="$DOC/University"
export SEM="$UNI/Y5S2" # update this each semester
source "$HOME/.config/zsh/.secrets.zsh" # gitignored secrets
alias unsh="ssh ${UNSW_ZID}@login.cse.unsw.edu.au"
alias uni="cd $SEM"
alias 2041="cd $SEM/COMP2041/"
alias 3141="cd $SEM/COMP3141/"
alias 2859="cd $SEM/MATH2859/"

# md - mkdir and cd into it
function md() {
  mkdir $1 && cd $1
}

# --- PLUGINS ---
# zsh-autosuggestions
#source ${HOME}/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#bindkey '<tab>' autosuggest-accept

# zsh-syntax-highlighting 
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root line)

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
path+=("$HOME/Documents/Projects/go-auto-wallpaper/bin") # automatic wallpaper changer
path+=("$HOME/Documents/Projects/c-mac-display-macro/dist") # display configuration macro
path+=("$HOME/Documents/Projects/c-math2400-utils/dist") # custom finite math utils
path+=("$HOME/Documents/Projects/py_quickscript/bin") # quickscript
path+=("$HOME/.scripts")
export PATH

# --- CLEAN HOME DIRECOTY ---
rm -f "$HOME/.DS_Store"\
    .python_history .bash_history .lesshst .viminfo
