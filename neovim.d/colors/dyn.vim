" ===============================================
" dyn.vim --- Color Theme 
" Copyright (c) 2021-20xx aylax.dyn
" Author: aylax.dyn <aylax.dyn@gmail.com>
" ===============================================


" Init: {{{
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

if !has('gui_running') && &t_Co != 256
    finish
endif

set background=dark

let g:colors_name='dyn'

if !exists("g:no_bg")
    let g:no_bg = 0
endif
" }}}


" Color Palette: {{{
let s:dyn = {}
let s:none = ['NONE', 'NONE']
" -----------------------------------------|-----RGB-----|-------HSL------|
let s:dyn.white         = ['#fdf6e3', 230] " 253 246 227 |  44°  87% 100% |
let s:dyn.lightblue     = ['#dce7fd', 189] " 220 231 253 | 220°  89%  93% |
let s:dyn.yellow        = ['#f3e4a2', 229] " 243 228 162 |  49°  77%  79% |
let s:dyn.orange        = ['#ffb793', 216] " 255 183 147 |  20° 100%  79% |
let s:dyn.red           = ['#f36a66', 203] " 243 106 102 |   2°  85%  68% |
let s:dyn.orchid        = ['#ff8adb', 213] " 255 138 219 | 318° 100%  77% |
let s:dyn.purple        = ['#bd93f9', 141] " 189 147 249 | 265°  89%  78% |
let s:dyn.blue          = ['#93b4ff',  75] " 147 180 255 | 222° 100%  79% |
let s:dyn.bluegray      = ['#7b94a5', 103] " 123 148 165 | 204°  19%  56% |
let s:dyn.green         = ['#84fba2', 121] " 132 251  16 | 135°  94%  75% |
let s:dyn.verylightgray = ['#c5c8c6', 251] " 197 200 198 | 140°   3%  78% |
let s:dyn.background    = ['#2b2836', 236] "  43  40  54 | 253°  15%  18% |
let s:dyn.comments      = ['#655e7f',  60] " 101  94 127 | 253°  15%  43% |
let s:dyn.cursor        = ['#423e53', 239] "  66  62  83 | 251°  14%  28% |
let s:dyn.cursor2       = ['#383546', 237] "  56  53  70 | 251°  14%  24% |

let s:white = s:dyn.white
let s:yellow = s:dyn.yellow
let s:orange = s:dyn.orange
let s:red = s:dyn.red
let s:pink = s:dyn.orchid
let s:purple = s:dyn.purple
let s:blue = s:dyn.blue
let s:bluegray = s:dyn.bluegray
let s:green = s:dyn.green
let s:vlgray = s:dyn.verylightgray
let s:fg1 = s:dyn.comments
let s:fg0 = s:dyn.lightblue
if g:no_bg == 0
    let s:bg = s:dyn.background
else
    let s:bg = s:none
endif
let s:c = s:dyn.cursor
let s:c2 = s:dyn.cursor2
" }}}


" Attributes: {{{
let s:bold = 'bold'
let s:italic = 'italic'
let s:underline = 'underline'
let s:reverse = 'reverse'
let s:undercurl = 'undercurl'
" }}}


" Highlight Function: {{{
function! s:hi(group, ...)
    " Arguments: group, guifg/ctermfg, guibg/ctermbg, gui/cterm/term, *guisp

    " foreground
    if a:0 >=# 1
        let l:fg = a:1
    else
        let l:bg = s:none
    endif

	" background
    if a:0 >=# 2
        let l:bg = a:2
    else
        let l:bg = s:none
    endif

	" attribute
    if a:0 >=# 3 && strlen(a:3)
        let l:attr = a:3
    else
        let l:attr = 'NONE'
    endif

    let l:highlight = [ 'hi!', a:group,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attr, 'cterm=' . l:attr, 'term=' . l:attr
        \ ]

    " special
    if a:0 >=# 4
        call add(l:highlight, 'guisp=' . a:4[0])
    endif

    execute join(l:highlight, ' ')
endfunction
" }}}


" Basic: {{{
call s:hi('Normal', s:fg0, s:bg)
" normal text
" background

call s:hi('Comment', s:fg1)
" any Comment:
" /* */, //, #, " , etc.

call s:hi('Constant', s:blue)
" any constant:
" string
" character
" number
" boolean
" float

call s:hi('Identifier', s:bluegray)
" any variable name:
" any function name:

call s:hi('Statement', s:green)
" any statement:
" conditional:
" if, then, else, endif, switch, etc.
" repeat:
" for, do, while, etc.
" label:
" case, default, etc.
" operator:
" "sizeof", "+", "*", etc.
" keyword:
" any other keyword
" exception:
" try, catch, throw

call s:hi('PreProc', s:orange)
" preProc:
" generic preprocessor
" include:
" preprocessor #Include
" define:
" preprocessor #Define
" macro:
" same as Define
" preCondit:
" preprocessor #if, #else, #endif, etc.

call s:hi('Type', s:yellow)
" any type:
" int, long, char, etc.
" storageClass:
" static, register, volatile, etc.
" structure:
" struct, union, enum, etc.
" typedef:
" a typedef

call s:hi('Special', s:pink)
" any special symbol:
" specialChar:
" special character in a constant
" tag:
" you can use CTRL-J on this
" delimiter:
" character that needs attention
" specialComment:
" special things inside a comment
" debug:
" debugging statements

call s:hi('Underlined', s:purple)
" underlined:
" text that stands out, HTML links

call s:hi('Ignore', s:bluegray)
" ignore:
" left blank, hidden |hl-Ignore|

call s:hi('Error', s:red)
" error:
" any erroneous construct

call s:hi('Todo', s:pink)
" todo:
" anything that needs extra attention
" }}}



" General UI: {{{
call s:hi('MatchParen', s:orange, s:none, s:reverse)
" The character under the cursor or just before it,
" if it is a paired bracket, and its match.
 
hi! link NonText Comment
" '~' and '@' at the end of the window,
" characters from 'showbreak' and other character
" that do not really exist in the text
" (e.g., ">" displayed when a double-wide character
" doesn't fit at the end of the line)

hi! link SpecialKey Comment
" meta and special keys listen with ":map", also for text used
" to show unprintable characters in the text, 'listchars'.
" Generally :  text that is displayed differently from what it
" really is

call s:hi('Delimiter', s:bluegray)

call s:hi('VertSplit', s:c, s:vlgray, s:reverse)
" the column separating vertically split windows

call s:hi('StatusLine', s:c, s:fg0, s:reverse)
" status line of current window

call s:hi('StatusLineNC', s:c2, s:fg1, s:reverse)
" status lines of not-current windows

call s:hi('LineNr', s:blue, s:none)
" s:c2 colors bg of line nr's
" line number for ":number" and ":#" commands, and when 'number'
" or 'relativenumber' option is set

call s:hi('CursorLine', s:none, s:c)
" the screen line that the cursor is in when
" 'cursorline' is set

call s:hi('CursorColumn', s:none, s:c)
" the screen column that the cursor is in when
" 'cursorcolumn' is set

call s:hi('CursorLineNr', s:fg0, s:bg)
" Like LineNr when 'cursorline' or 'relativenumber' is set for
" the cursor line

call s:hi('MoreMsg', s:green)
" |more-prompt|

hi! link ModeMsg MoreMsg
" 'showmode' message (e.g., "--INSERT--")

call s:hi('Question', s:green)
" |hit-enter| propmt and yes/no questions

call s:hi('ErrorMsg', s:red, s:none, s:reverse)
" error messages on the command line

call s:hi('Search', s:yellow, s:none, s:reverse)
" last search pattern highlighting (see 'hlsearch).
" also used for highlighting the current lin in the quickfix
" window and similar items that need to stand out

call s:hi('Title', s:orange)
" titles for output from ":set all", ":autocmd" etc.

hi! link Directory Constant
" directory names (and other special names in listings)

call s:hi('WarningMsg', s:orange, s:none, s:reverse)
" warning messages

call s:hi('Visual', s:vlgray, s:none, s:reverse)
" selected piece of text for an operator in "visual mode"

hi! link WildMenu Search
" current match in 'wildmenu' completion

call s:hi('Conceal', s:bluegray)
" placeholder characters substituted for concealed
" text (see 'conceallevel')

call s:hi('DiffAdd', s:blue, s:none, s:reverse)
" diff mode: added line |diff.txt|

call s:hi('DiffChange', s:purple, s:none, s:reverse)
" diff mode: changed line

call s:hi('DiffDelete', s:vlgray, s:red, s:reverse)
" diff mode: deleted line

hi! link DiffText ErrorMsg
" diff mode: changed text within a changed line

call s:hi('SignColumn', s:bluegray, s:fg0, s:reverse)
" column where |signs| are displayed

call s:hi('Folded', s:fg1, s:c2)
" line used for closed folds

call s:hi('FoldColumn', s:none, s:bluegray)
" 'foldcolumn'

call s:hi('Pmenu', s:purple, s:none, s:reverse)
" popup menu: normal item

" call s:hi('PmenuSel',)
" popup menu: slected item
" call s:hi('PmenuSbar',)
" popup menu: scrollbar
" call s:hi('PmenuThumb',)
" popup menu: thumb of the scrollbar

call s:hi('SpellBad', s:red)
" word that is not recognised by the spellchecker. |spell|
" gvim has undercurl attributes
" but normal vim just colors and NO underline

call s:hi('SpellCap', s:blue)
" word that should start with a capital.

call s:hi('SpellRare', s:purple)
" word that is recognised by the spellchecker as one that is
" hardly ever used.

call s:hi('SpellLocal', s:bluegray)
" word that is recognised by the spellchecker as one that is
" used in another region.

if has("gui_running") && has("spell")
" if gvim set "spell" attributes to "undercurl"

    call s:hi('SpellBad', s:none, s:none, s:undercurl, s:red)
    call s:hi('SpellCap', s:none, s:none, s:undercurl, s:blue)
    call s:hi('SpellRare', s:none, s:none, s:undercurl, s:purple)
    call s:hi('SpellLocal', s:none, s:none, s:undercurl, s:fg1)

endif
" }}}


" Vim Status Line: {{{
let sheader1 = "%#S1# \ %<%.50F %= \%*"
let smarker1 = "%#S2# \ %y%m%r%h%w \%*"
let smarker2 = "%#S3# \ [%{&ff}][%{&fenc}] \%*"
let sfooter1 = "%#S4# \ (%l, %c) \%*"
let sfooter2 = "%#S5# \ %3p%% \%*"
let sheadera = sheader1
let smarkera = smarker1.smarker2
let sfootera = sfooter1.sfooter2
let sformata = sheadera.smarkera.sfootera

call s:hi('S1', s:purple)
call s:hi('S2', s:green)
call s:hi('S3', s:orange)
call s:hi('S4', s:blue)
call s:hi('S5', s:green)

set statusline=%!sformata
" }}}


" Markdown: {{{
hi! link markdownH1 htmlArg
hi! link markdownH2 htmlArg
hi! link markdownH3 htmlArg
hi! link markdownH4 htmlArg
hi! link markdownH5 htmlArg
hi! link markdownH6 htmlArg
hi! link markdownHeadingRule htmlTag
hi! link markdownHeadingDelimiter htmlArg
hi! link markdownLinkText htmlTagName
hi! link markdownId htmlTag
call s:hi('markdownBlockquote', s:bluegray, s:bluegray)
call s:hi('markdownItalic', s:pink, s:none, s:italic)
call s:hi('markdownBold', s:bluegray, s:none, s:bold)
hi! link markdownListMarker cssTextProp
hi! link markdownUrlTitleDelimiter cssTextProp
hi! link markdownCode Statement
hi! link markdownCodeDelimiter Statement
hi! link markdownCodeBlock Statement
" }}}


" YAML: {{{
call s:hi('yamlYAMLVersion', s:green, s:none)
hi! link yamlYAMLDirective yamlYAMLVersion
hi! link yamlDocumentStart htmlTag
hi! link yamlBlockMappingKey htmlArg
hi! link yamlKeyValueDelimiter htmlTag
hi! link yamlInteger jsNumber
hi! link yamlAnchor yamlYAMLVersion
hi! link yamlAlias yamlYAMLVersion
hi! link yamlFloat jsNumber
" }}}


" Help: {{{
hi! link helpStar Statement
hi! link helpBar Todo
hi! link helpExample Underlined
" }}}


" Vim: {{{
hi! link vimVar Underlined 
hi! link vimFunc Underlined
hi! link vimFuncName Underlined
hi! link vimHiBang Error
" }}}


" Rust: {{{
" TODO: to be add
" }}}

