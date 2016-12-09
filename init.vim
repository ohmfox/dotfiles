" ------------------------------------------------------------ VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle setup
let path='$HOME/.config/nvim/bundle'
call plug#begin('~/.config/nvim/plugged')
" Functionality
Plug 'kien/ctrlp.vim'
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
function! DoRemote(arg)
	UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'moll/vim-bbye'

" Syntax & Languages
Plug 'groenewege/vim-less'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sekel/vim-vue-syntastic'
Plug 'elixir-lang/vim-elixir'
Plug 'sophacles/vim-bundle-mako'
Plug 'StanAngeloff/php.vim'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'mustache/vim-mustache-handlebars'
Plug 'kern/vim-es7'
Plug 'othree/es.next.syntax.vim'
Plug 'posva/vim-vue'
Plug 'lambdatoast/elm.vim'
Plug 'othree/html5-syntax.vim'
Plug 'wavded/vim-stylus'

" Themes
Plug 'freeo/vim-kalisi'
Plug 'flazz/vim-colorschemes'
Plug 'git@bitbucket.org:kisom/eink.vim.git'
Plug 'robertmeta/nofrils'
Plug 'roosta/vim-srcery'

Plug 'ervandew/supertab'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'ternjs/tern_for_vim', {'do':'npm install '}
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }

" Writing Plugins
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-pencil'
Plug 'PProvost/vim-markdown-jekyll'
Plug 'tpope/vim-markdown'
Plug 'junegunn/goyo.vim'

call plug#end()

filetype on

" ------------------------------------------------------------ LOOKS
set termguicolors
syntax enable

set background=dark
colorscheme srcery

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
highlight VertSplit ctermbg=NONE
set cursorline

" ------------------------------------------------------------ FOLDING MARKERS

set foldmarker=#--,--
set foldlevel=0
set foldmethod=marker

" ------------------------------------------------------------ TIMESTAMPING ON F5

"These timestamps might be a little too detailed for your use (2016-01-19 Tue 10:48 am)
"The day and time may be redundant and too cluttered
nmap <F5> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F5> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" ------------------------------------------------------------ LIGHTLINE
let g:lightline = {
			\ 'colorscheme': 'seoul256',
			\ 'component_function': {
			\   'readonly': 'LightLineReadonly',
			\   'modified': 'LightLineModified',
			\   'fileformat': 'LightLineFileformat',
			\   'ctrlpmark': 'CtrlPMark',
			\   'filetype': 'LightLineFiletype',
      \   'syntastic': 'LightLineSyntastic',
			\   'filename': 'LightLineFilename',
			\ },
			\ 'active': {
			\   'left': [ [ 'filename'], [ 'readonly', 'modified' ]],
			\   'right': [ [ 'lineinfo', 'syntastic' ], [ 'ctrlpmark' ]]
			\ },
			\ 'separator': { 'left': ' ', 'right': ' ', },
			\ 'subseparator': { 'left': '|', 'right': '|', },
			\ }
set noshowmode
function! LightLineFilename()
	let fname = expand('%:t')
	return fname == 'ControlP' ? g:lightline.ctrlp_item :
				\ fname == '__Tagbar__' ? g:lightline.fname :
				\ fname =~ '__Gundo\|NERD_tree' ? '' :
				\ &ft == 'vimfiler' ? vimfiler#get_status_string() :
				\ &ft == 'unite' ? unite#get_status_string() :
				\ &ft == 'vimshell' ? vimshell#get_status_string() :
				\ ('' != fname ? fname : '[No Name]')
endfunction
function! LightLineModified()
	if &filetype == "help"
		return ""
	elseif &modified
		return "💀"
	elseif &modifiable
		return "🍕"
	else
		return "🍕"
	endif
endfunction

function! LightLineSyntastic()
  if SyntasticStatuslineFlag() == ""
    return "a"
  else
    return "b"
endfunction

function! LightLineReadonly()
	if &filetype == "help"
		return "🐙"
	elseif &readonly
		return "🐙"
	else
		return ""
	endif
endfunction
function! CtrlPMark()
	if expand('%:t') =~ 'ControlP'
		call lightline#link('iR'[g:lightline.ctrlp_regex])
		return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
					\ , g:lightline.ctrlp_next], 0)
	else
		return ''
	endif
endfunction
let g:ctrlp_status_func = {
			\ 'main': 'CtrlPStatusFunc_1',
			\ 'prog': 'CtrlPStatusFunc_2',
			\ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
	let g:lightline.ctrlp_regex = a:regex
	let g:lightline.ctrlp_prev = a:prev
	let g:lightline.ctrlp_item = a:item
	let g:lightline.ctrlp_next = a:next
	return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
	return lightline#statusline(0)
endfunction

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
"move current line to the end of buffer without moving cursor
nnoremap <Leader>mv ddGp``
"copy current line to the end of buffer without moving cursor
nnoremap <Leader>cp YGp``

map <Leader>sc :setlocal spell<esc>

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

map K  <Plug>(expand_region_expand)
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

" ------------------------------------------------------------ COPY/PASTE
""""" LEADER COPY/CUT/PASTE COMMMANDS
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
"""""

" ------------------------------------------------------------ CTRLP
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 2     " smart path mode
let g:ctrlp_mru_files = 1             " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2        " Jump to tab AND buffer if already open
""""" USE AG FOR
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"""""
let g:ctrlp_split_window = 1          " <CR> = New Tab
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" ------------------------------------------------------------ SYNTASTIC
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <Leader>e :SyntasticCheck<CR>
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_vue_checkers = ['eslint']

" ------------------------------------------------------------ SUPERTAB
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<C-x><C-o>"  
set completeopt-=preview  

" ------------------------------------------------------------ NERDTREE
autocmd VimEnter * wincmd p
noremap <C-\> :NERDTreeToggle<CR>         " use ctrl-\ to open nerdtree
autocmd StdinReadPre * let s:std_in=1
"""""
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"""""
let g:NERDTreeWinPos = "left"        " set nerdtree to right side
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

" ------------------------------------------------------------ Random
au BufNewFile,BufRead *.mak set filetype=mako

" ------------------------------------------------------------ Terminal Mode Settings
tnoremap <Esc> <C-\><C-n>


" ------------------------------------------------------------ Writing
map <Leader>f :Goyo<cr>
function! MarkdownOn()
  set spell spelllang=en_us
  highlight CursorLine ctermbg=NONE
endfunction

autocmd Filetype markdown call MarkdownOn()

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#thesaurus_key = '<Leader>t'

let g:jsx_ext_required = 0

set inccommand=split

" ------------------------------------------------------------ Macros
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl

