" Vim filetype plugin file
" Language:         MetaPost
" Maintainer:       Nikolai Weibull <now@bitwi.se>
" Latest Revision:  2006-07-04

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl com< cms< fo<"

setlocal comments=:% commentstring=%\ %s formatoptions-=t formatoptions+=croql

if exists(":FixBeginfigs") != 2
  command -nargs=0 FixBeginfigs call s:fix_beginfigs()

  function! s:fix_beginfigs()
    let i = 1
    g/^beginfig(\d*);$/s//\='beginfig('.i.');'/ | let i = i + 1
  endfunction
endif
