" vimballPlugin : construct a file containing both paths and files
" Author: Charles E. Campbell, Jr.
" Copyright: (c) 2004-2006 by Charles E. Campbell, Jr.
"            The VIM LICENSE applies to Vimball.vim, and Vimball.txt
"            (see |copyright|) except use "Vimball" instead of "Vim".
"            No warranty, express or implied.
"  *** ***   Use At-Your-Own-Risk!   *** ***
"
" (Rom 2:1 WEB) Therefore you are without excuse, O man, whoever you are who
"      judge. For in that which you judge another, you condemn yourself. For
"      you who judge practice the same things.
" GetLatestVimScripts: 1502 1 :AutoInstall: vimball.vim

" ---------------------------------------------------------------------
"  Load Once: {{{1
if &cp || exists("g:loaded_vimballPlugin")
 finish
endif
let g:loaded_vimballPlugin = 1
let s:keepcpo              = &cpo
set cpo&vim

" ------------------------------------------------------------------------------
" Public Interface: {{{1
com! -ra   -complete=dir -na=+ -bang MkVimball call vimball#MkVimball(<line1>,<line2>,<bang>0,<f-args>)
com! -na=? -complete=dir UseVimball  call vimball#Vimball(1,<f-args>)
com! -na=0               VimballList call vimball#Vimball(0)
com! -na=* -complete=dir RmVimball   call vimball#RmVimball(<f-args>)
au BufEnter  *.vba.gz,*.vba.bz2,*.vba.zip call vimball#Decompress(expand("<amatch>"))
au BufEnter  *.vba setlocal noma bt=nofile fmr=[[[,]]] fdm=marker|call vimball#ShowMesg(0,"Source this file to extract it! (:so %)")

" =====================================================================
" Restoration And Modelines: {{{1
" vim: fdm=marker
let &cpo= s:keepcpo
unlet s:keepcpo
