"============================================================================
" VUNDLE REQUIRED
"============================================================================
"
set nocompatible              " be iMproved, required
filetype off                  " required
source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/vimrc_example.vim
behave mswin

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" Usage:
"   PluginInstall
"   PluginClean

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'scrooloose/nerdtree'

" Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'vim-scripts/Conque-GDB'

" Plugin 'easymotion/vim-easymotion'

Plugin 'tpope/vim-fugitive'

Plugin 'mileszs/ack.vim'





call vundle#end()


"============================================================================
" NON-VUNDLE CONFIG
"============================================================================
"set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

" NERDTree Options
"let NERDTreeWinSize=31
"let NERDTreeWinPos=left
" nerdtree-tabs options
let g:nerdtree_tabs_open_on_new_tab=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_synchronize_view = 0
let g:nerdtree_tabs_autoclose = 0
let g:nerdtree_tabs_open_on_console_startup = 0

" Airline
let g:airline_powerline_fonts = 1

set guifont=Courier_New:h10:cANSI:qDEFAULT
set backspace=indent,eol,start
set ruler
set showcmd
set hlsearch
set incsearch
set number
set nowrap
colorscheme ir_black_jje
filetype on
filetype plugin on
filetype plugin indent on

autocmd FileType text setlocal textwidth=78
autocmd FileType markdown setlocal textwidth=55
autocmd FileType c setlocal textwidth=78

syntax on
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,winpos,globals,resize

set colorcolumn=+1
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" This is used by filetype.vim script in $VIMRUNTIME to set filetype for .h
" files to c instead of default cpp
let g:c_syntax_for_h = 1


autocmd FileType c setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c setlocal foldmethod=syntax

autocmd FileType cpp setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType cpp setlocal foldmethod=syntax

autocmd FileType python setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal foldmethod=syntax

autocmd FileType perl let perl_fold=1
autocmd FileType perl setlocal foldlevelstart=1 textwidth=80
autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType php let php_folding = 2


" autocmd BufWritePost $MYVIMRC source $MYVIMRC


:map <F6> <C-w>W <C-w>_
:map <F7> <C-w>_
:map <S-F7> <C-w>=
:map <F8> <C-w>w <C-w>_
:map <S-F9> :NERDTreeToggle<CR>

:map <S-F12> :wa<Bar>exe "mksession!"<CR>

" CtrlP - always jump to open buffer
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_switch_buffer = 'ET'

set printoptions=header:2,syntax:y,number:y,wrap:y,duplex:off,portrait:n,paper:letter


set directory=.,C:\temp,c:\tmp
set backupdir=$HOME\vimfiles\backup,C:\temp,C:\tmp,.


":compiler iar
"set path=.,,**,C:\Program\\\ Files\\\ (x86)\IAR\\\ Systems\Embedded\\\ Workbench\\\ 7.0\arm\inc,C:\Program\\\ Files\\\ (x86)\IAR\\\ Systems\Embedded\\\ Workbench\\\ 7.0\arm\inc\dlib
"au BufEnteer *.c compiler iar

set diffexpr=MyDiff()
if exists("*MyDiff")
    delfunction MyDiff
endif
function MyDiff()
   let opt = '-a --binary '
   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
   let arg1 = v:fname_in
   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
   let arg2 = v:fname_new
   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
   let arg3 = v:fname_out
   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
   if $VIMRUNTIME =~ ' '
     if &sh =~ '\<cmd'
       if empty(&shellxquote)
         let l:shxq_sav = ''
         set shellxquote&
       endif
       let cmd = '"' . $VIMRUNTIME . '\diff"'
     else
       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
     endif
   else
     let cmd = $VIMRUNTIME . '\diff'
   endif
   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
   if exists('l:shxq_sav')
     let &shellxquote=l:shxq_sav
   endif
 endfunction


