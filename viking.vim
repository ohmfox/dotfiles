" Viking.vim -- Vim color scheme.
" Author:      ohmfox (conlindurbin@gmail.com)
" Webpage:     http://conlin.xyz
" Description: A colorscheme fit for a norseman.
"
" --------------------------------
set background=dark
" --------------------------------

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="viking"

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=none    ctermbg=234    cterm=none
hi Cursor          ctermfg=none    ctermbg=none    cterm=none
hi CursorLine      ctermfg=none    ctermbg=235    cterm=none
hi LineNr          ctermfg=232    ctermbg=none    cterm=none
hi CursorLineNR    ctermfg=none    ctermbg=none    cterm=none

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=none    ctermbg=none    cterm=none
hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
hi Folded          ctermfg=none    ctermbg=none    cterm=none

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
hi VertSplit       ctermfg=none    ctermbg=none    cterm=none
hi ColorColumn     ctermfg=none    ctermbg=none    cterm=none
hi TabLine         ctermfg=none    ctermbg=238    cterm=none
hi TabLineFill     ctermfg=none    ctermbg=238    cterm=none
hi TabLineSel      ctermfg=0    ctermbg=254    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=81    ctermbg=none    cterm=none
hi Search          ctermfg=81    ctermbg=none    cterm=none
hi IncSearch       ctermfg=81    ctermbg=none    cterm=none

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=none    ctermbg=none    cterm=none
hi StatusLineNC    ctermfg=none    ctermbg=none    cterm=none
hi WildMenu        ctermfg=none    ctermbg=none    cterm=none
hi Question        ctermfg=none    ctermbg=none    cterm=none
hi Title           ctermfg=none    ctermbg=none    cterm=none
hi ModeMsg         ctermfg=none    ctermbg=none    cterm=none
hi MoreMsg         ctermfg=none    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=none    ctermbg=none    cterm=none
hi Visual          ctermfg=0    ctermbg=254    cterm=none
hi VisualNOS       ctermfg=0    ctermbg=254    cterm=none
hi NonText         ctermfg=none    ctermbg=none    cterm=none

hi Todo            ctermfg=none    ctermbg=none    cterm=none
hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi Error           ctermfg=none    ctermbg=none    cterm=none
hi ErrorMsg        ctermfg=none    ctermbg=none    cterm=none
hi WarningMsg      ctermfg=none    ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=none    ctermbg=none    cterm=none
hi String          ctermfg=none    ctermbg=none    cterm=none
hi StringDelimiter ctermfg=none    ctermbg=none    cterm=none
hi Character       ctermfg=none    ctermbg=none    cterm=none
hi Number          ctermfg=none    ctermbg=none    cterm=none
hi Boolean         ctermfg=none    ctermbg=none    cterm=none
hi Float           ctermfg=none    ctermbg=none    cterm=none

hi Identifier      ctermfg=117    ctermbg=none    cterm=none
hi Function        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=117    ctermbg=none    cterm=none
hi Conditional     ctermfg=none    ctermbg=none    cterm=none
hi Repeat          ctermfg=none    ctermbg=none    cterm=none
hi Label           ctermfg=none    ctermbg=none    cterm=none
hi Operator        ctermfg=117    ctermbg=none    cterm=none
hi Keyword         ctermfg=none    ctermbg=none    cterm=none
hi Exception       ctermfg=none    ctermbg=none    cterm=none
hi Comment         ctermfg=236    ctermbg=none    cterm=none

hi Special         ctermfg=none    ctermbg=none    cterm=none
hi SpecialChar     ctermfg=none    ctermbg=none    cterm=none
hi Tag             ctermfg=none    ctermbg=none    cterm=none
hi Delimiter       ctermfg=none    ctermbg=none    cterm=none
hi SpecialComment  ctermfg=none    ctermbg=none    cterm=none
hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
hi PreProc         ctermfg=none    ctermbg=none    cterm=none
hi Include         ctermfg=none    ctermbg=none    cterm=none
hi Define          ctermfg=none    ctermbg=none    cterm=none
hi Macro           ctermfg=none    ctermbg=none    cterm=none
hi PreCondit       ctermfg=none    ctermbg=none    cterm=none

hi Type            ctermfg=none    ctermbg=none    cterm=none
hi StorageClass    ctermfg=117    ctermbg=none    cterm=none
hi Structure       ctermfg=117    ctermbg=none    cterm=none
hi Typedef         ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=none    ctermbg=none    cterm=none
hi DiffChange      ctermfg=none    ctermbg=none    cterm=none
hi DiffDelete      ctermfg=none    ctermbg=none    cterm=none
hi DiffText        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=none    ctermbg=none    cterm=none
hi PmenuSel        ctermfg=none    ctermbg=none    cterm=none
hi PmenuSbar       ctermfg=none    ctermbg=none    cterm=none
hi PmenuThumb      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=88    ctermbg=none    cterm=underline
hi SpellCap        ctermfg=none    ctermbg=none    cterm=none
hi SpellLocal      ctermfg=none    ctermbg=none    cterm=none
hi SpellRare       ctermfg=none    ctermbg=none    cterm=none

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------
