"------ Vundle setup -----------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"------ End Vundle setup -----------

"------ Syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"------ End Syntastic settings


" Do syntax highlighting
syntax enable

colorscheme mark_herald

" Wrap navigation
set whichwrap+=<,>,h,l,[,]

" Display line numbers
set number

" This enables automatic indentation as you type.
filetype indent on

" Shortcuts to switch between tabs
noremap <S-h> gT
noremap <S-l> gt

" place yanked text into the global clipboard
" stackoverflow.com/questions/9166328/hot-to-copy-selected-lines-to-clipboard
" -in-vim
set clipboard=unnamedplus



" Build Commands
autocmd FileType haskell map <buffer> <C-b> :! ghc -O2 %:r && ./%:r<CR>

autocmd FileType tex map <buffer> <C-b> :! pdflatex %:r <CR>

autocmd FileType cpp map <buffer> <C-b> :! make && ./%:r<CR>

autocmd FileType python map <buffer> <C-b> :! python %:r.py<CR>

autocmd FileType ocaml map <buffer> <C-b> :! ocaml %:r.ml<CR>


" set 80 column color
highlight ColorColumn ctermbg=Black
autocmd FileType ocaml let &colorcolumn=join(range(81,999),",")
autocmd FileType c let &colorcolumn=join(range(81,999),",")
autocmd FileType text let &colorcolumn=join(range(81,999),",")
autocmd FileType matlab let &colorcolumn=join(range(81,999),",")

set expandtab
set shiftwidth=2
set softtabstop=2
