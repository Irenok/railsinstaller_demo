" netrwSettings.vim: makes netrw settings simpler
" Date:		Mar 26, 2007
" Maintainer:	Charles E Campbell, Jr <drchipNOSPAM at campbellfamily dot biz>
" Version:	9
" Copyright:    Copyright (C) 1999-2007 Charles E. Campbell, Jr. {{{1
"               Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this copyright
"               notice is copied with it. Like anything else that's free,
"               netrwSettings.vim is provided *as is* and comes with no
"               warranty of any kind, either expressed or implied. By using
"               this plugin, you agree that in no event will the copyright
"               holder be liable for any damages resulting from the use
"               of this software.
"
" Mat 4:23 (WEB) Jesus went about in all Galilee, teaching in their {{{1
"                synagogues, preaching the gospel of the kingdom, and healing
"                every disease and every sickness among the people.
" Load Once: {{{1
if exists("g:loaded_netrwSettings") || &cp
  finish
endif
let g:loaded_netrwSettings  = "v9"

" ---------------------------------------------------------------------
" NetrwSettings: {{{1
fun! netrwSettings#NetrwSettings()
  " this call is here largely just to insure that netrw has been loaded
  call netrw#NetSavePosn()
  if !exists("g:loaded_netrw")
   echohl WarningMsg | echomsg "***sorry*** netrw needs to be loaded prior to using NetrwSettings" | echohl None
   return
  endif

  above wincmd s
  enew
  setlocal noswapfile bh=wipe
  set ft=vim
  file Netrw\ Settings

  " these variables have the following default effects when they don't
  " exist (ie. have not been set by the user in his/her .vimrc)
  if !exists("g:netrw_liststyle")
   let g:netrw_liststyle= 0
   let g:netrw_list_cmd= "ssh HOSTNAME ls -FLa"
  endif
  if !exists("g:netrw_silent")
   let g:netrw_silent= 0
  endif
  if !exists("g:netrw_use_nt_rcp")
   let g:netrw_use_nt_rcp= 0
  endif
  if !exists("g:netrw_ftp")
   let g:netrw_ftp= 0
  endif
  if !exists("g:netrw_ignorenetrc")
   let g:netrw_ignorenetrc= 0
  endif

  put ='+ ---------------------------------------------'
  put ='+  NetrwSettings:  by Charles E. Campbell, Jr.'
  put ='+ Press <F1> with cursor atop any line for help'
  put ='+ ---------------------------------------------'
  let s:netrw_settings_stop= line(".")

  put =''
  put ='+ Netrw Protocol Commands'
  put = 'let g:netrw_dav_cmd           = '.g:netrw_dav_cmd
  put = 'let g:netrw_fetch_cmd         = '.g:netrw_fetch_cmd
  put = 'let g:netrw_ftp_cmd           = '.g:netrw_ftp_cmd
  put = 'let g:netrw_http_cmd          = '.g:netrw_http_cmd
  put = 'let g:netrw_rcp_cmd           = '.g:netrw_rcp_cmd
  put = 'let g:netrw_rsync_cmd         = '.g:netrw_rsync_cmd
  put = 'let g:netrw_scp_cmd           = '.g:netrw_scp_cmd
  put = 'let g:netrw_sftp_cmd          = '.g:netrw_sftp_cmd
  put = 'let g:netrw_ssh_cmd           = '.g:netrw_ssh_cmd
  let s:netrw_protocol_stop= line(".")
  put = ''

  put ='+Netrw Transfer Control'
  put = 'let g:netrw_cygwin            = '.g:netrw_cygwin
  put = 'let g:netrw_ftp               = '.g:netrw_ftp
  put = 'let g:netrw_ftpmode           = '.g:netrw_ftpmode
  put = 'let g:netrw_ignorenetrc       = '.g:netrw_ignorenetrc
  put = 'let g:netrw_sshport           = '.g:netrw_sshport
  let shqline= line("$")
  put = 'let g:netrw_shq...'
  put = 'let g:netrw_use_nt_rcp        = '.g:netrw_use_nt_rcp
  put = 'let g:netrw_win95ftp          = '.g:netrw_win95ftp
  let s:netrw_xfer_stop= line(".")
  put =''
  put ='+ Netrw Messages'
  put ='let g:netrw_use_errorwindow    = '.g:netrw_use_errorwindow

  put = ''
  put ='+ Netrw Browser Control'
  put = 'let g:netrw_alto              = '.g:netrw_alto
  put = 'let g:netrw_altv              = '.g:netrw_altv
  put = 'let g:netrw_browse_split      = '.g:netrw_browse_split
  if exists("g:netrw_browsex_viewer")
   put = 'let g:netrw_browsex_viewer    = '.g:netrw_browsex_viewer
  else
   put = 'let g:netrw_browsex_viewer    = (not defined)'
  endif
  put = 'let g:netrw_dirhistmax        = '.g:netrw_dirhistmax
  put = 'let g:netrw_fastbrowse        = '.g:netrw_fastbrowse
  put = 'let g:netrw_ftp_browse_reject = '.g:netrw_ftp_browse_reject
  put = 'let g:netrw_ftp_list_cmd      = '.g:netrw_ftp_list_cmd
  put = 'let g:netrw_ftp_sizelist_cmd  = '.g:netrw_ftp_sizelist_cmd
  put = 'let g:netrw_ftp_timelist_cmd  = '.g:netrw_ftp_timelist_cmd
  put = 'let g:netrw_hide              = '.g:netrw_hide
  put = 'let g:netrw_keepdir           = '.g:netrw_keepdir
  put = 'let g:netrw_list_cmd          = '.g:netrw_list_cmd
  put = 'let g:netrw_list_hide         = '.g:netrw_list_hide
  put = 'let g:netrw_local_mkdir       = '.g:netrw_local_mkdir
  put = 'let g:netrw_local_rmdir       = '.g:netrw_local_rmdir
  put = 'let g:netrw_liststyle         = '.g:netrw_liststyle
  put = 'let g:netrw_maxfilenamelen    = '.g:netrw_maxfilenamelen
  put = 'let g:netrw_menu              = '.g:netrw_menu
  put = 'let g:netrw_mkdir_cmd         = '.g:netrw_mkdir_cmd
  put = 'let g:netrw_rename_cmd        = '.g:netrw_rename_cmd
  put = 'let g:netrw_rm_cmd            = '.g:netrw_rm_cmd
  put = 'let g:netrw_rmdir_cmd         = '.g:netrw_rmdir_cmd
  put = 'let g:netrw_rmf_cmd           = '.g:netrw_rmf_cmd
  put = 'let g:netrw_silent            = '.g:netrw_silent
  put = 'let g:netrw_sort_by           = '.g:netrw_sort_by
  put = 'let g:netrw_sort_direction    = '.g:netrw_sort_direction
  put = 'let g:netrw_sort_sequence     = '.g:netrw_sort_sequence
  put = 'let g:netrw_ssh_browse_reject = '.g:netrw_ssh_browse_reject
  put = 'let g:netrw_scpport           = '.g:netrw_scpport
  put = 'let g:netrw_sshport           = '.g:netrw_sshport
  put = 'let g:netrw_timefmt           = '.g:netrw_timefmt
  put = 'let g:netrw_use_noswf         = '.g:netrw_use_noswf
  put = 'let g:netrw_winsize           = '.g:netrw_winsize

  put =''
  put ='+ For help, place cursor on line and press <F1>'

  1d
  silent %s/^+/"/e
  res 99
  silent %s/= \([^0-9].*\)$/= '\1'/e
  silent %s/= $/= ''/e
  1

  " Put in shq setting.
  " (deferred so as to avoid the quote manipulation just preceding)
  if g:netrw_shq == "'"
   call setline(shqline,'let g:netrw_shq               = "'.g:netrw_shq.'"')
  else
   call setline(shqline,"let g:netrw_shq               = '".g:netrw_shq."'")
  endif

  set nomod

  nmap <buffer> <silent> <F1>                       :call NetrwSettingHelp()<cr>
  nnoremap <buffer> <silent> <leftmouse> <leftmouse>:call NetrwSettingHelp()<cr>
  let tmpfile= tempname()
  exe 'au BufWriteCmd	Netrw\ Settings	silent w! '.tmpfile.'|so '.tmpfile.'|call delete("'.tmpfile.'")|set nomod'
endfun

" ---------------------------------------------------------------------
" NetrwSettingHelp: {{{2
fun! NetrwSettingHelp()
"  call Dfunc("NetrwSettingHelp()")
  let curline = getline(".")
  if curline =~ '='
   let varhelp = substitute(curline,'^\s*let ','','e')
   let varhelp = substitute(varhelp,'\s*=.*$','','e')
"   call Decho("trying help ".varhelp)
   try
    exe "he ".varhelp
   catch /^Vim\%((\a\+)\)\=:E149/
   	echo "***sorry*** no help available for <".varhelp.">"
   endtry
  elseif line(".") < s:netrw_settings_stop
   he netrw-settings
  elseif line(".") < s:netrw_protocol_stop
   he netrw-externapp
  elseif line(".") < s:netrw_xfer_stop
   he netrw-variables
  else
   he netrw-browse-var
  endif
"  call Dret("NetrwSettingHelp")
endfun

" ---------------------------------------------------------------------
" Modelines: {{{1
" vim:ts=8 fdm=marker
