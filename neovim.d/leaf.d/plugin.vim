" ===============================================
" plugin.vim --- Hub 
" Copyright (c) 2021-20xx AyLax.Zhou
" Author: AyLax.Zhou <zhoubye@foxmail.com>
" ===============================================


" :PlugStatus    # Exec for show available plugins
" :PlugInstall   # Exec for install
" :PlugUpdate    # Exec for update
" :PlugDiff      # Exec for show mutations
" :PlugClean     # Exec for clean after delete plugin
call plug#begin('~/.config/nvim/plugins')


"" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

"" NERDTree
Plug 'preservim/nerdtree'

"" Snippets
Plug 'SirVer/ultisnips'

call plug#end()


" Configuration

"" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-space> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1

"" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets.d"]

