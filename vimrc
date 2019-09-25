set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'fatih/vim-go'
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'crusoexia/vim-monokai'
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set backspace=start,eol,indent
set whichwrap=b,s,[,],<,>,~
set mouse=
set number
set hlsearch
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


call vundle#end()


" Set autocommand
if has('autocmd')
	au FileType python setl ts=8 sw=4 sts=4 et
	au FileType go setl ts=4 sts=4 sw=4
	au StdinReadPre * let s:std_in=1
	au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif | if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
endif

filetype plugin indent on

" Set syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set color-scheme
colorscheme monokai

" Set Hotkey
nmap <silent> <Tab> 15<Right>
vmap <silent> <Tab> <C-o>15<Right>
nmap <silent> <S-Tab> 15<Left>
vmap <silent> <S-Tab> <C-o>15<Left>
nmap <silent> <C-n>	 :update<CR>:bn<CR>
imap <silent> <C-n> <ESC>:update<CR>:bn<CR>
vmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
cmap <silent> <C-n> <ESC>:update<CR>:bn<CR>

if has("cscope")
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif

if has("mac")
	nmap <silent> <C-d> <Plug>DashSearch
endif
