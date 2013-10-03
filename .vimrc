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
