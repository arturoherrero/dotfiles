" Turn on color syntax highlighting
syntax on

" Markdown highlighting (default only for *.markdown files)
au BufRead,BufNewFile *.md set filetype=markdown
" Jbuilder highlighting
au BufRead,BufNewFile *.jbuilder set filetype=ruby

" Show line numbers
set number
" Switch to hybrid mode with relative numbers, Ctrl-n
nnoremap <C-n> :set relativenumber!<ENTER>

" Displaying indent levels. Ctrl-i
nmap <C-i> <Plug>IndentGuidesToggle

" Jumps to search word as you type
set incsearch
" Highlighting search matches
set hlsearch
" Temporarily get out of the highlighted search, Ctrl-l
nnoremap <C-l> :nohlsearch<CR><C-l>
" Automatically highlighting off in insert mode
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

" Becomming root to save a document, just type `w!!`
cmap w!! %!sudo tee > /dev/null %

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

" Complete longest common string, then list alternatives
set wildmode=longest,list

" Record the last 200 commands
set history=200

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ekalinin/Dockerfile.vim'

call vundle#end()
filetype plugin indent on

" Show hidden files NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$']
" Reveal file in NERDTree, Ctrl-a
nmap <C-a> :NERDTreeFind<CR>
" Configure NERDTree arrow symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Rainbow Parentheses always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
