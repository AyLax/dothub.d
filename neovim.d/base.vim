"=============================================================================
" base.vim --- Basic
" Copyright (c) 2021-20xx AyLax.Zhou
" Author: AyLax.Zhou < zhoubye@foxmail.com >
" License: GPLv3
"=============================================================================

" Sets disable vi mode
set nocompatible

" Sets reserved history lines
set history=240

" Sets filetype plugin on
filetype plugin on
filetype indent on

" Sets map leader
let mapleader = ";"

" Sets basic encoding
set encoding=utf8

" Sets plain text format
set syntax=on
set tabstop=4
set backspace=2
set ruler                         " Open status bar ruler
set cursorline                    " Highlight the current line
set number                        " Show line number
set showmatch                     " Highlight matched brackets
set matchtime=1                   " Brackets highlight residence time

" Sets status line
let sheader = "%1*\%<%.50F"
let smarker = "%=%2*\%y%m%r%h%w\ %*%3*\%{&ff}\[%{&fenc}]\ %*"
let sfooter = "%4*\ (%l, %c) %*%5*\%3p%%\%*"
let sformat = sheader.smarker.sfooter
set statusline=%!sformat
set laststatus=2
