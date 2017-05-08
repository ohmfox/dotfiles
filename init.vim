" ------------------------------------------------------------ VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle setup
let path='$HOME/.config/nvim/bundle'
call plug#begin('~/.config/nvim/plugged')

" Functionality
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/mru.vim'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'
Plug 'Raimondi/delimitMate'
Plug 'ohmfox/NerdIgnore'
Plug 'ohmfox/ProjectLevel'
Plug 'tpope/vim-git'
Plug 'benmills/vimux'

" Colors
Plug 'arcticicestudio/nord-vim'

function! DoRemote(arg)
	UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'moll/vim-bbye'

" Syntax & Languages
Plug 'sheerun/vim-polyglot'
Plug 'captbaritone/better-indent-support-for-php-with-html'

Plug 'ervandew/supertab'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'othree/jspc.vim'
Plug 'moll/vim-node'
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }

call plug#end()

filetype on

" ------------------------------------------------------------ LOOKS
set termguicolors
syntax enable

set background=dark
colorscheme nord


" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
highlight VertSplit ctermbg=NONE
set cursorline

" ------------------------------------------------------------ FOLDING MARKERS

set foldmarker=#--,--
set foldlevel=0
set foldmethod=marker

" Reload Vim when .vimrc is changed
augroup reload_vimrc
	autocmd!
	autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

" ------------------------------------------------------------ LEADER

let mapleader="\<Space>"              " leader is <space>

" open up Silver Searcher with <space>a
nnoremap <Leader>a :Ag 

" insert line with <space>Enter
nnoremap <Leader><CR> o<esc>
 
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" insert line in insert mode with <ctrl>c
imap <C-c> <CR><Esc>O

" unhighlight everything
nnoremap <Leader>x :noh<CR>
nnoremap <Leader>q :Bdelete<CR>

""""" Buffer navigation (<Space>,) (<Space>]) (<Space>[) (<space>ls)
map <Leader>, <C-^>
map <Leader>] :bnext<CR>
map <Leader>[ :bprev<CR>
map <Leader>ls :buffers<CR>
:nnoremap <Leader>s :SemanticHighlightToggle<cr>


" ------------------------------------------------------------ INDENTATION

set tabstop=2				                  " two spaces per tab
filetype indent on                    " load filetype-specific indents
set expandtab                         " tabs are spaces
set shiftwidth=2                      " set indentation columns
set softtabstop=2                     " number of columns in insert mode
set smartindent                       " indent files smartly

" ------------------------------------------------------------ BEHAVIOR

set relativenumber                    " make line numbers relative
set nu                                " show line numbers
set backspace=indent,eol,start        " fix backspace behavior
set laststatus=2                      " Always show status line
set magic                             " enable extended regexes.
set noerrorbells                      " disable annoying error bells
set visualbell                        " disable use visual bells
set ofu=syntaxcomplete#Complete       " Set omni-completion method.
set ttyfast                           " more keys/sec == 1337 H4X0R

map K <Plug>(expand_region_expand)
" use K to expand select region
map J <Plug>(expand_region_shrink)
" use J to shrink select region
let g:deoplete#enable_at_startup = 1

let g:expand_region_text_objects = {
			\ 'iw'  :0,
			\ 'iW'  :0,
			\ 'i"'  :0,
			\ 'i''' :0,
			\ 'i]'  :1,
			\ 'ib'  :1, 
			\ 'iB'  :1,
			\ 'il'  :0,
			\ 'ip'  :0,
			\ 'ie'  :0,
			\ }

set shortmess=atI                     " no stupid intro message
set showmode                          " Show the current mode.
set showtabline=2                     " Always show tab bar.
set lazyredraw                        " Don't redraw all the time
set showmatch                         " highlight matching [{}]
" Move more naturally up/down when wrapping is enabled.
nnoremap j gj
nnoremap k gk

" ------------------------------------------------------------ SEARCH
set incsearch                         " search as characters are typed
set hlsearch                          " highlight matches
set ignorecase                        " ignore case of searches
set gdefault                          " default to global search
set smartcase                         " ignore ignore case if uppercase letters
set wrapscan                          " Searches wrap around end of file

" ------------------------------------------------------------ WILDMENU
set wildmenu                          " use wildmenu
set wildchar=<TAB>                    " tab complete commands

""""" IGNORE CERTAIN EXTENSION IN WILDMENU
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
"""""
set wildmode=list:longest             " Complete only until point of ambiguity.
set winminheight=0                    " splits reduced to single line.

" ------------------------------------------------------------ HISTORY
set hidden                            " remember buffer history
set history=1000                      " increase history from 20 to 1000

" ------------------------------------------------------------ UNDO/SWAP/BACKUP
set undofile                                  " persistent undo
set backupdir=~/.config/nvim/backups          " use global backup directory
set directory=~/.config/nvim/swaps            " use global swaps directory
set undodir=~/.config/nvim/undo               " use global undo directory

if has('persistent_undo')
	set rtp+=~/configit/vim/modules/undotree
	nnoremap <silent> <Space>u :UndotreeToggle<CR>
	let g:undotree_SetFocusWhenToggle = 1
	set undofile
	set undodir=~/.undodir/
	set undolevels=1000
	set undoreload=10000
endif

" ------------------------------------------------------------ MOVEMENT
""""" EASYMOTION PREFIX <space>e
nmap <Leader>e <Plug>(easymotion-prefix)
"""""

" ------------------------------------------------------------ STRING
""""" LEADER COPY/CUT/PASTE/REPLACE COMMMANDS
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
vmap <Leader>r "hy:%s/<C-r>h//gc<left><left><left>
"""""

" ------------------------------------------------------------ SYNTASTIC
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <Leader>e :SyntasticCheck<CR>
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_vue_checkers = ['eslint']

" ------------------------------------------------------------ NERDTREE
autocmd VimEnter * wincmd p
noremap <C-\> :NERDTreeToggle<CR>         " use ctrl-\ to open nerdtree
autocmd StdinReadPre * let s:std_in=1
"""""
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"""""
let g:NERDTreeWinPos = "left"        " set nerdtree side
function! s:CloseIfOnlyControlWinLeft()
	if winnr("$") != 1
		return
	endif
	if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
				\ || &buftype == 'quickfix'
		q
	endif
endfunction
augroup CloseIfOnlyControlWinLeft
	au!
	au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

" ------------------------------------------------------------ Extra Functions
autocmd Filetype gitcommit setlocal spell textwidth=72


" ------------------------------------------------------------ Insert Math
map gbc yyp jOscale=2<Esc>:.,+1!bc<CR>kJ


" ------------------------------------------------------------ Random
au BufNewFile,BufRead *.mak set filetype=mako

" ------------------------------------------------------------ Terminal Mode Settings
tnoremap <Esc> <C-\><C-n>
set inccommand=split

" ------------------------------------------------------------ Macros
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl

" ------------------------------------------------------------ JS
let g:jsx_ext_required = 0

