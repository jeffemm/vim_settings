set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set number
set nowrap
colorscheme ir_black_jje
filetype on
filetype plugin on
filetype plugin indent on
autocmd FileType text setlocal textwidth=78

set directory=.,C:\temp,c:\tmp
set backupdir=$HOME\vimfiles\backup,C:\temp,C:\tmp,.

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,winpos,globals,resize

set colorcolumn=+1
set shiftwidth=2
set tabstop=2
set expandtab

" This is used by filetype.vim script in $VIMRUNTIME to set filetype for .h
" files to c instead of default cpp
let g:c_syntax_for_h = 1

autocmd FileType c setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c setlocal textwidth=78
autocmd FileType c setlocal foldmethod=syntax

:map <F6> <C-w>W <C-w>_
:map <F7> <C-w>_
:map <F8> <C-w>w <C-w>_

:map <S-F12> :wa<Bar>exe "mksession!"<CR>


set printoptions=header:2,syntax:y,number:y,wrap:y,duplex:off,portrait:n,paper:letter

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


