" Vim filetype plugin file
" Language:         Vim help file
" Maintainer:       Nikolai Weibull <now@bitwi.se>
" Latest Revision:  2006-04-19

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl fo< tw<"

setlocal formatoptions+=tcroql textwidth=78
