" Turn on color syntax highlighting
syntax on

" Show line numbers
set number

" Jumps to search word as you type
set incsearch
" Highlighting search matches
set hlsearch
" Temporarily get out of the highlighted search
nnoremap <C-l> :nohlsearch<CR><C-l>
" Automatically highlighting off in insert mode
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

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

" Indentation
set autoindent

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-endwise'
Bundle 'mileszs/ack.vim'
Bundle 'jistr/vim-nerdtree-tabs'

filetype plugin indent on

" Show hidden files NERDTree
let NERDTreeShowHidden=1
