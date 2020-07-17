
let g:ConqueGdb_GdbExe = 'arm-none-eabi-gdb'

call plug#begin('~/.config/nvim/plugged')
" Using master branch
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

Plug 'tpope/vim-fugitive'

Plug 'qpkorr/vim-bufkill'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang --rust-completer --system-boost'}

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'develop' }

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jlanzarotta/bufexplorer'

"Editing
Plug 'tpope/vim-commentary'
Plug 'mrtazz/DoxygenToolkit.vim'

Plug 'kana/vim-operator-user'
"Plug 'rhysd/vim-clang-format'

Plug 'vim-scripts/a.vim'
Plug 'machakann/vim-highlightedyank'

" Syntactic language support
Plug 'rust-lang/rust.vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }



" Add plugins to &runtimepath
call plug#end()


"===== Terminal ====="
" Set exiting term mode to esc esc
tnoremap <esc><esc> <C-\><C-n>


set incsearch
set ignorecase
set smartcase
set tabstop=4 shiftwidth=4 expandtab
set wrap linebreak nolist  " list disables line break
" indicate where the 80 chars wide is
set cc=100
set textwidth=0
set wrapmargin=0
set spell spelllang=en_us
set number
set relativenumber
set langmenu=en_US
let $LANG = 'en_US'
set cursorline
" retain undo history in buffers
set hidden
" set so the files auto updates when changed on disk
set autoread
" Better default for yanking
:map Y y$


"===== Key bindings ====="
map <C-b> :BufExplorer<CR> " Explore buffers
map <C-K> :bnext<CR> " Next buffer!
map <C-J> :bprev<CR> " Prev buffer!
"map <C-L> :tabn<CR>  " Next tab
"map <C-H> :tabp<CR>  " Prev tab

"===== Clang Format ====="
" Settings for clang-format
let g:clang_format#detect_style_file = 1
let g:clang_format#enable_fallback_style = 0
let g:clang_format#auto_format_on_insert_leave = 1

" map to <Leader>cf in C++ code
" autocmd FileType c,h,cpp,hpp,objc nnoremap <C-f> :<C-u>ClangFormat<CR>
" autocmd FileType c,h,cpp,hpp,objc vnoremap <C-f> :ClangFormat<CR>

"autocmd FileType c,cpp,h,hpp xnoremap <=> :'<,'>ClangFormat<CR>
"autocmd FileType c,cpp,objc map <buffer> = <Plug>(operator-clang-format)
"===== Airline ====="
set ttimeoutlen=50
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#checks = [ 'indent' ]

"===== DoxyGen ====="
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""
let g:DoxygenToolkit_authorName="Kristoffer Ödmark"
"let g:DoxygenToolkit_licenseTag="My own license" <-- !!! Does not end with "\<enter>"<F37>

"===== Misc ====="
"
set nocompatible
" Dont update view in scripts, 10000 times speedup
set lazyredraw
" set Colour support so airline works
set t_Co=256
" set mouse activated
set mouse=
set clipboard=unnamedplus
" Include stdlib dirs for 'gf' command. Also include all subdir in
" workingfolder
let &path.="src/include,/usr/include/AL,.**"
"Search for tags file, from current directory until home directory
set tags=./tags;$HOME

" Map f4 to switch header/source for c projects
"map <F4> :find %:t:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
map <F4> :A<CR>

"Map autoformat after bsd rules
"autocmd BufNewFile,BufRead *.c set formatprg=astyle\ --style=bsd

" Doxygen syntax
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
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

" Automatic include guards in new header files
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#pragma once"
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

"

"===== NERDTree ====="
" Automatically enable NERDTree on startup
"autocmd vimenter * NERDTree

"Auto close if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"toggle on Ctrl+n
map <C-n> :NERDTreeToggle <cr>

":let g:NERDTreeWinSize=60


"===== YouCompleteMe ====="
" remap the jump to tag to use YouCompleteMe instead, then use jumplist CTRL+I
" and CTRL+O to jump back and forth
nnoremap <C-]> :YcmCompleter GoTo <cr>

"Youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" every write should generate a new file for youcompleteme
" map :w<cr> :w<cr>:YcmGenerateConfig -f -q<cr>

"===== Typo fixes ====="
"Fix common typos when saving and exiting
command WQ wq
command Wq wq
command W  w
command Q  q

"===== Close current buffer ====="
nnoremap <C-x> :BW<cr>

"===== Persistent Undo ====="
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

"===== Rust ====="
autocmd FileType rust nnoremap <buffer> <C-f> :RustFmt<CR>
let g:rustfmt_autosave = 1
let g:rustfmt_command = "rustfmt"
au BufNewFile,BufRead *.rs setlocal colorcolumn=100
let g:ycm_rust_src_path = '~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

"===== No swap files ====="
set backupdir-=.
set backupdir^=~/tmp,/tmp

"===== Fold the code ====="
set foldmethod=syntax
" activate the folder
set foldcolumn=1
" automatically fold larger files, for small ones, it doesn't matter
autocmd! BufReadPost * :if line('$') < 150 | set foldlevel=99 | else | set foldlevel=1 |endif
