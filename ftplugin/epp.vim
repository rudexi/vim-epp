" Vim filetype plugin
" Language: epp
" Maintainer: Guillaume Ludinard

if exists("b:did_ftplugin")
  finish
endif

if !exists("b:epp_subtype")
  let s:lines = getline(1)."\n".getline(2)."\n".getline(3)."\n".getline(4)."\n".getline(5)."\n".getline("$")
  let b:epp_subtype = matchstr(s:lines,'epp_subtype=\zs\w\+')
  if b:epp_subtype == ''
    let b:epp_subtype = g:epp_default_subtype
  endif
endif

if exists("b:epp_subtype") && b:epp_subtype != '' && b:epp_subtype!=? 'epp'
  exe "runtime! ftplugin/".b:epp_subtype.".vim ftplugin/".b:epp_subtype."_*.vim ftplugin/".b:epp_subtype."/*.vim"
endif
unlet! b:did_ftplugin
