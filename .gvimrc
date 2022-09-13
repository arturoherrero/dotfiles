" Setting the font in the GUI
set guifont=Monaco:h14

" Solarized color scheme
set background=light
colorscheme solarized

" netrw configuration
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_list_hide = '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
  autocmd TabNew * call feedkeys(":Vexplore\<CR>", 'n')
augroup END