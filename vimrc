set nocompatible              " be iMproved, required
filetype off                  " required

syntax on
filetype plugin indent on
set whichwrap+=<,>,h,l,[,]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set number
set relativenumber
set mouse=a

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_haskell_ghc_mod_exec = 'ghc-mod.sh'
let g:syntastic_haskell_ghc_mod_args = '-g -fno-warn-unused-binds -g -fno-warn-unused-matches -g -fno-wanr-unused-do-bind'
let g:syntastic_gcc_args = "-w"
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Shortcuts to switch between tabs
noremap <S-h> gT
noremap <S-l> gt

highlight ColorColumn ctermbg=DarkGrey guibg=#2c2d27

" Haskell Commands
autocmd FileType haskell map <buffer> <C-b> :! ghc -O2 %:r && ./%:r<CR>
autocmd FileType haskell map <buffer> <C-_> 0i--<esc> 
autocmd FileType haskell map <buffer> <C-d> :s/^--//<CR>

autocmd FileType tex map <buffer> <C-b> :! pdflatex %:r <CR>

autocmd FileType cpp map <buffer> <C-b> :! make && ./%:r<CR>

autocmd FileType python map <buffer> <C-b> :! python %:r.py<CR>

" OCaml Commands
autocmd FileType ocaml map <buffer> <C-b> :! ocaml %:r.ml<CR>

" set 80 column color
autocmd FileType ocaml let &colorcolumn=join(range(81,999),",")

"set cindent

set expandtab
set shiftwidth=2
set softtabstop=2
