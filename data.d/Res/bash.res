#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


PS1='[\u@\h \W]\$ '
alias ls='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep --color=auto'
alias vim='nvim'
alias find='fd'
alias grep='rg'
alias loc='tokei'


export EDITOR=vim
export PATH=/home/aylax/.local/bin:$PATH
. "$HOME/.cargo/env"
