set shell=/bin/bash

"------ Vundle setup -----------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'alvan/vim-closetag'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Raimondi/delimitMate'

Bundle 'lervag/vimtex'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'vim-airline/vim-airline'

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

" Stop delimitMate from matching angle brackets since vim-closetag handles
" this in html
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:}"

"------ Powerline Settings -------
set rtp+=$HOME/.vim/bundle/powerline/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

"------ End Powerline setup -----------
"
"------ Syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Hide some latex warnings
" https://stackoverflow.com/questions/28282315/how-can-i-turn-off-specific-messages-in-syntastic-vim
let g:syntastic_quiet_messages = {"type": "style", "regex": 'possible unwanted\|Whitespace\|Dots'}

"------ End Syntastic settings

"------ VimTeX settings -------
" https://github.com/lervag/vimtex/issues/467

let g:vimtex_latexmk_options = '-pdf -shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
"------ End VimTeX settings

" Do syntax highlighting
syntax enable

" Highlight trailing whitespace
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
highlight ExtraWhitespace ctermbg=lightgreen guibg=lightgreen
match ExtraWhitespace /\s\+$/

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

" Remap semicolon to colon
nmap ; :

" Build Commands
autocmd FileType haskell map <buffer> <C-b> :! ghc -O2 %:r && ./%:r<CR>

autocmd FileType tex map <buffer> <C-b> :! pdflatex %:r <CR>

autocmd FileType cpp map <buffer> <C-b> :! make && ./%:r<CR>

autocmd FileType python map <buffer> <C-b> :! python %:r.py<CR>

autocmd FileType ocaml map <buffer> <C-b> :! ocaml %:r.ml<CR>

autocmd FileType html map <buffer> <C-b> :! ../build %:r.html  ../view_%:r.html<CR><CR>

autocmd! BufNewFile,BufRead *.pde map <buffer> <C-b> :! cd .. && /usr/lib/processing-3.1.1/processing-java --sketch=%:r --run<CR>


" set 80 column color
highlight ColorColumn ctermbg=Black
autocmd FileType ocaml let &colorcolumn=join(range(81,999),",")
autocmd FileType c let &colorcolumn=join(range(81,999),",")
autocmd FileType cpp let &colorcolumn=join(range(81,999),",")
autocmd FileType text let &colorcolumn=join(range(81,999),",")

set expandtab
set shiftwidth=2
set softtabstop=2

" indent wrapped lines
set breakindent

" move navigate on wrapped lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" Remove all trailing whitespace by pressing F5
" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
nnoremap <F5> :call TrimWhitespace()<CR>

" Highlight search results
set hlsearch

" fswitch (switching to header file) mappings
noremap  <Leader>h :FSHere <CR>


" Set .h and .hh as acceptable header formats for .c files
au! BufEnter *.cc let b:fswitchdst = 'h,hh' | let b:fswitchlocs = '../inc'
au! BufEnter *.h let b:fswitchdst = 'c,cc,cpp' | let b:fswitchlocs = '../inc'

" use fswitch to switch between flex and bison files
au! BufEnter *.l let b:fswitchdst = 'y,yy' | let b:fswitchlocs = '../inc'
au! BufEnter *.ll let b:fswitchdst = 'yy,y' | let b:fswitchlocs = '../inc'
au! BufEnter *.y let b:fswitchdst = 'l' | let b:fswitchlocs = '../inc'
au! BufEnter *.yy let b:fswitchdst = 'll,l' | let b:fswitchlocs = '../inc'

" https://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff
"if &diff
    "colorscheme evening
"endif


" Wordcount
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#formatter = 'default'
