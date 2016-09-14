"
" Manjaro version
set nocompatible
" Dont update view in scripts, 10000 times speedup
set lazyredraw
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

"#execute pathogen#infect()
call plug#begin('~/.config/nvim/plugged')
" Using master branch
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'sirtaj/vim-openscad'

Plug 'mrtazz/DoxygenToolkit.vim'

Plug 'qpkorr/vim-bufkill'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --system-libclang' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'scrooloose/nerdtree'


" Add plugins to &runtimepath
call plug#end()

" Set exiting term mode to esc esc
tnoremap <esc><esc> <C-\><C-n>

let g:UltiSnipsExpandTrigger='<C-s>'
"let g:UltiSnipsListSnippets='<C-l>'
let g:UltiSnipsJumpForwardTrigger='<C-b>'
let g:UltiSnipsJumpBackwardTrigger='<C-z>'
"let g:UltiSnipsSnippetsDir="~/.config/nvim/bundle/vim-snippets"

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
" Better default for yanking
:map Y y$

" Default for YouCompleteMe
" let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Key bindings
map <C-b> :make <CR> " Builds using make
map <C-K> :bnext<CR> " Next buffer!
map <C-J> :bprev<CR> " Prev buffer!
"map <C-L> :tabn<CR>  " Next tab
"map <C-H> :tabp<CR>  " Prev tab

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
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
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
let g:cpp_class_scope_highlight = 1
syntax enable
"set background=dark
"let g:rehash256 = 1
colorscheme molokai

" Save your backups to a less annoying place than the current directory.
" It saves it to ~/.vim/backup or . if all else fails.
if isdirectory('~/.nvim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif

set backupdir-=.
set backupdir+=.
set backupdir^=~/.nvim/backup/
set backup

" Automatic include guards in new header files
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction

function! s:include_header()
endfunction

function! s:autoauthor()
    execute "DoxAuthor"
endfunction

autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
autocmd BufNewFile *.{c,cpp} call <SID>include_header()
autocmd BufNewFile *.{c,cpp,h,hpp} call <SID>autoauthor()

"NERDTree
" Automatically enable NERDTree on startup
"autocmd vimenter * NERDTree

"Auto close if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"toggle on Ctrl+n
map <C-n> :NERDTreeToggle <cr>

"set backupdir=~/.nvim/backup//
"set directory=~/.nvim/swp//

" remap the jump to tag to use YouCompletMe instead, then use jumplist CTRL+I
" and CTRL+O to jump back and forth
nnoremap <C-]> :YcmCompleter GoTo <cr>
