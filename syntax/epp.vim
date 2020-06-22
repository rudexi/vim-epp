" Vim syntax file
" Language: Epp

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'epp'
endif

if !exists("g:epp_default_subtype")
  let g:epp_default_subtype = "conf"
endif

if !exists("b:epp_subtype")
  let s:lines = getline(1)."\n".getline(2)."\n".getline(3)."\n".getline(4)."\n".getline(5)."\n".getline("$")
  let b:epp_subtype = matchstr(s:lines,'epp_subtype=\zs\w\+')
  if b:epp_subtype == ''
    let b:epp_subtype = g:epp_default_subtype
  endif
endif

if exists("b:epp_subtype")
  exe "runtime! syntax/".b:epp_subtype.".vim"
endif
unlet! b:current_syntax

syn include @puppetTop syntax/puppet.vim
syn cluster eppRegions contains=eppBlock,eppExpression,eppComment,eppParameters

syn region eppBlock
  \ matchgroup=eppDelimiter
  \ start="<%-\=" end="-\=%>"
  \ contains=@puppetTop
  \ containedin=ALLBUT,@eppRegions
  \ keepend
syn region eppExpression
  \ matchgroup=eppDelimiter
  \ start="<%=" end="-\=%>"
  \ contains=@puppetTop
  \ containedin=ALLBUT,@eppRegions
  \ keepend
syn region eppComment
  \ matchgroup=eppDelimiterComment
  \ start="<%#" end="-\=%>"
  \ contains=@puppetTop
  \ containedin=ALLBUT,@eppRegions
  \ keepend
syn region eppParameters
  \ matchgroup=eppDelimiterParameters
  \ start="<%-\=\s\=|" end="|\s\=-\=%>"
  \ contains=@puppetTop
  \ containedin=ALLBUT,@eppRegions
  \ keepend

" Define the default highlight
hi def link eppDelimiter PreProc
hi def link eppComment Comment
hi def link eppDelimiterComment Comment
hi def link eppDelimiterParameters PreProc

let b:current_syntax = 'epp'

if main_syntax == 'epp'
  unlet main_syntax
endif
