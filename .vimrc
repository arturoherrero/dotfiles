" Turn on color syntax highlighting
syntax on

"Reload files changed outside vim
set autoread

" CoffeeScript highlighting
au BufRead,BufNewFile *.coffee set filetype=javascript
" Jbuilder highlighting
au BufRead,BufNewFile *.jbuilder set filetype=ruby
" Markdown highlighting (default only for *.markdown files)
au BufRead,BufNewFile *.md set filetype=markdown

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

" Becoming root to save a document, just type `w!!`
cmap w!! %!sudo tee > /dev/null %

" 80 and 120 column indications
set colorcolumn=80,120

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

" Highlight trailing white space
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Strip trailing white spaces
function! StripTrailingWhitespaces()
  " preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Pretty print JSON
function! FormatJSON()
  " preparation: save cursor position.
  let l = line(".")
  let c = col(".")
  :%!jq .
  " restore previous cursor position
  call cursor(l, c)
  :set syntax=json
endfunction

" Complete longest common string, then list alternatives
set wildmode=longest,list

" Record the last 1000 commands
set history=1000

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Toggle spell checking, Ctrl-s
nnoremap <C-s> :set spell!<ENTER>
" Set region to American English
set spelllang=en_us
