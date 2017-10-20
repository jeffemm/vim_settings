" ---- Beginning of ${vimfiles}/compiler/iar.vim ----
" Compiler:     IAR icc

if exists("current_compiler")
  finish
endif
let current_compiler = "iar"

" errorformat matches errors like:
" ...
"      MyOneArgumentFunction();
"                            ^
""MyFile.c",666  Error[Pe165]: too few arguments in function call
"
" ...
" Warnings are matched similarly.
"
set makeprg=C:\Program\\\ Files\\\ (x86)\IAR\\\ Systems\Embedded\\\ Workbench\\\ 7.0\common\bin\IarBuild.exe -o\ %<\ %
CompilerSet errorformat=%E%p^,%Z\"%f\"\\\,%l\ \ Error[Pe%n]:\ %m,%W%p^,%Z\"%f\"\\\,%l\ \ Warning[Pe%n]:\ %m

" ---- End of Vim compiler file ----
