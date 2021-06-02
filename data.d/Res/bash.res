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

export _ZO_ECHO=1
export _ZO_MAXAGE=2048
export _ZO_RESOLVE_SYMLINKS=1
export _ZO_DATA_DIR=/home/aylax/.local/share/zoxide

. "$HOME/.cargo/env"
eval "$(zoxide init bash)"
