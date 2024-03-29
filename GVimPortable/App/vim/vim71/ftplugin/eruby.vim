" Vim filetype plugin
" Language:		eRuby
" Maintainer:		Tim Pope <vimNOSPAM@tpope.info>
" Info:			$Id: eruby.vim,v 1.10 2007/05/06 16:05:40 tpope Exp $
" URL:			http://vim-ruby.rubyforge.org
" Anon CVS:		See above site
" Release Coordinator:	Doug Kearns <dougkearns@gmail.com>

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

let s:save_cpo = &cpo
set cpo-=C

" Define some defaults in case the included ftplugins don't set them.
let s:undo_ftplugin = ""
let s:browsefilter = "All Files (*.*)\t*.*\n"
let s:match_words = ""

if !exists("g:eruby_default_subtype")
  let g:eruby_default_subtype = "html"
endif

if !exists("b:eruby_subtype")
  let s:lines = getline(1)."\n".getline(2)."\n".getline(3)."\n".getline(4)."\n".getline(5)."\n".getline("$")
  let b:eruby_subtype = matchstr(s:lines,'eruby_subtype=\zs\w\+')
  if b:eruby_subtype == ''
    let b:eruby_subtype = matchstr(substitute(expand("%:t"),'\c\%(\.erb\)\+$','',''),'\.\zs\w\+$')
  endif
  if b:eruby_subtype == 'rhtml'
    let b:eruby_subtype = 'html'
  elseif b:eruby_subtype == 'rb'
    let b:eruby_subtype = 'ruby'
  elseif b:eruby_subtype == 'yml'
    let b:eruby_subtype = 'yaml'
  elseif b:eruby_subtype == 'js'
    let b:eruby_subtype = 'javascript'
  elseif b:eruby_subtype == 'txt'
    " Conventional; not a real file type
    let b:eruby_subtype = 'text'
  elseif b:eruby_subtype == ''
    let b:eruby_subtype = g:eruby_default_subtype
  endif
endif

if exists("b:eruby_subtype") && b:eruby_subtype != ''
  exe "runtime! ftplugin/".b:eruby_subtype.".vim ftplugin/".b:eruby_subtype."_*.vim ftplugin/".b:eruby_subtype."/*.vim"
else
  runtime! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim
endif
unlet! b:did_ftplugin

" Override our defaults if these were set by an included ftplugin.
if exists("b:undo_ftplugin")
  let s:undo_ftplugin = b:undo_ftplugin
  unlet b:undo_ftplugin
endif
if exists("b:browsefilter")
  let s:browsefilter = b:browsefilter
  unlet b:browsefilter
endif
if exists("b:match_words")
  let s:match_words = b:match_words
  unlet b:match_words
endif

runtime! ftplugin/ruby.vim ftplugin/ruby_*.vim ftplugin/ruby/*.vim
let b:did_ftplugin = 1

" Combine the new set of values with those previously included.
if exists("b:undo_ftplugin")
  let s:undo_ftplugin = b:undo_ftplugin . " | " . s:undo_ftplugin
endif
if exists ("b:browsefilter")
  let s:browsefilter = substitute(b:browsefilter,'\cAll Files (\*\.\*)\t\*\.\*\n','','') . s:browsefilter
endif
if exists("b:match_words")
  let s:match_words = b:match_words . ',' . s:match_words
endif

" Change the browse dialog on Win32 to show mainly eRuby-related files
if has("gui_win32")
  let b:browsefilter="eRuby Files (*.erb, *.rhtml)\t*.erb;*.rhtml\n" . s:browsefilter
endif

" Load the combined list of match_words for matchit.vim
if exists("loaded_matchit")
  let b:match_words = s:match_words
endif

" TODO: comments=
setlocal commentstring=<%#%s%>

let b:undo_ftplugin = "setl cms< "
      \ " | unlet! b:browsefilter b:match_words | " . s:undo_ftplugin

let &cpo = s:save_cpo

" vim: nowrap sw=2 sts=2 ts=8 ff=unix:
