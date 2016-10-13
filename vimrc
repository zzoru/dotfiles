scripte utf-8
set term=xterm-256color

set nocompatible
set backspace=start,eol,indent
set whichwrap=b,s,[,],<,>,~
set mouse=
syntax on
set number
set nohlsearch
set incsearch
set ignorecase
set wildmenu wildmode=list:full

" Set ctags
set tags=tags,./tags
set exrc
set nobackup

" Set cscope
set csprg=/usr/local/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
	cs add cscope.out
endif

" Set conceal level
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

" Set Plugin
set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'fatih/vim-go'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'ervandew/supertab'
Bundle 'tomasr/molokai'

call vundle#end()


" Set autocommand
if has('autocmd')
	au FileType python setl ts=8 sw=4 sts=4 et
	au FileType go setl ts=4 sts=4 sw=4
	au StdinReadPre * let s:std_in=1
	au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif

filetype plugin indent on

" Set syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set color-scheme
colorscheme molokai

" Set Hotkey
nmap <silent> <Tab> 15<Right>
vmap <silent> <Tab> <C-o>15<Right>
nmap <silent> <S-Tab> 15<Left>
vmap <silent> <S-Tab> <C-o>15<Left>
nmap <silent> <C-n>	 :update<CR>:bn<CR>
imap <silent> <C-n> <ESC>:update<CR>:bn<CR>
vmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
cmap <silent> <C-n> <ESC>:update<CR>:bn<CR>

if has("mac")
	nmap <silent> <C-d> <Plug>DashSearch
endif
