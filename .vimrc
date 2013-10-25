" Turn on color syntax highlighting
syntax on

" Show line numbers
set number

" Jumps to search word as you type
set incsearch

" Becomming root to save a document, just type `w!!`
cmap w!! %!sudo tee > /dev/null %

" Markdown highlighting (default only for *.markdown files)
au BufRead,BufNewFile *.md set filetype=markdown

" 80-column indication
set colorcolumn=80

" Not wrap lines
set nowrap

" Tab is two spaces
set tabstop=2
" Indentation is two spaces
set shiftwidth=2
" Tab characters entered will be changed to spaces
set expandtab

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on

" Show hidden files NERDTree
let NERDTreeShowHidden=1

" Command-T configuration
let g:CommandTMaxHeight=20
" Reload file list before each search
map <leader>t :CommandTFlush<cr>\|:CommandT<cr>
