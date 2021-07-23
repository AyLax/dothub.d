" ===============================================
" plugin.vim --- Plugin Hub 
" Copyright (c) 2021-20xx aylax.dyn
" Author: aylax.dyn <aylax.dyn@gmail.com>
" ===============================================


" :PlugStatus    # Exec for show available plugins
" :PlugInstall   # Exec for install
" :PlugUpdate    # Exec for update
" :PlugDiff      # Exec for show mutations
" :PlugClean     # Exec for clean after delete plugin
call plug#begin('~/.config/nvim/plugins')


"" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

"" Haskell
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell' }

"" NERDTree
Plug 'preservim/nerdtree'

"" Snippets
Plug 'SirVer/ultisnips'

"" Fzf Fast Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()


" Configuration


"" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>r :NERDTreeRefreshRoot<CR>
nnoremap <leader><space> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1

"" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets.d"]



"" Fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>s :Lines<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
