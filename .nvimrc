"
" Manjaro version
set nocompatible
" set Colour support so airline works
set t_Co=256
" set mouse activated
set mouse=
" Include stdlib dirs for 'gf' command. Also include all subdir in
" workingfolder
let &path.="src/include,/usr/include/AL,.**"
"Search for tags file, from current directory until home directory
set tags=./tags;$HOME

" Map f4 to switch header/source for c projects
map <F4> :find %:t:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
"Map autoformat after bsd rules
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ --style=bsd

" Doxygen syntax
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END


execute pathogen#infect()
" Set exiting term mode to esc esc
tnoremap <esc><esc> <C-\><C-n>

set incsearch
set ignorecase
set smartcase
set tabstop=4 shiftwidth=4 expandtab
set wrap linebreak nolist  " list disables line break
" indicate where the 80 chars wide is
set cc=80
set textwidth=0
set wrapmargin=0
set spell spelllang=en_us
set number
set langmenu=en_US
let $LANG = 'en_US'
set cursorline
" retain undo history in buffers
set hidden
" set so the files auto updates when changed on disk
set autoread

" Default for YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" Key bindings
map <C-b> :make <CR> " Builds using make
map <C-J> :bnext<CR> " Next buffer!
map <C-K> :bprev<CR> " Prev buffer!
map <C-L> :tabn<CR>  " Next tab
map <C-H> :tabp<CR>  " Prev tab

" Airline settings
set ttimeoutlen=50
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#checks = [ 'indent' ]

"Doxygen toolkit settings
let g:DoxygenToolkit_briefTag_pre="@Brief  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""
let g:DoxygenToolkit_authorName="Kristoffer Ödmark"
"let g:DoxygenToolkit_licenseTag="My own license" <-- !!! Does not end with "\<enter>"<F37>

"
set cursorline
highlight CursorLine guibg=blue guifg=NONE

" remove trailing white spaces when saving
autocmd BufWritePre * :%s/\s\+$//e

" OCaml settings
filetype indent on
filetype plugin on

au BufRead,BufNewFile *.ml,*.mli compiler ocaml

" auto open new tabs
"au BufAdd,BufNewFile * nested tab sball

" different color schemes depending on the file type
syntax enable
set background=dark
let g:rehash256 = 1
colorscheme molokai

" Save your backups to a less annoying place than the current directory.
" It saves it to ~/.vim/backup or . if all else fails.
if isdirectory('~/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir^=~/.vim/backup/
set backup

