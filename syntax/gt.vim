" Vim syntax file
" Language: Git Tree
" Maintainer: Javier Suarez
" Latest Revision: 26 Dec 2022

if exists("b:current_syntax")
  finish
endif

syn keyword gtTodo contained TODO FIXME XXX NOTE
syn match gtComment "#.*$" contains=gtTodo

"----------------------------------------------------------------
" Celestia Star Catalog Numbers
"----------------------------------------------------------------

" Regular int like number with - + or nothing in front
syn match gtNumber '\d\+' contained display
syn match gtNumber '[-+]\d\+' contained display

" Floating point number with decimal no E or e (+,-)
syn match gtNumber '\d\+\.\d*' contained display
syn match gtNumber '[-+]\d\+\.\d*' contained display

" Floating point like number with E and no decimal point (+,-)
syn match gtNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+' contained display
syn match gtNumber '\d[[:digit:]]*[eE][\-+]\=\d\+' contained display

" Floating point like number with E and decimal point (+,-)
syn match gtNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display
syn match gtNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display

syn region gtString start='"' end='"' contained
syn region gtDesc start='"' end='"'

syn match gtHip '\d\{1,6}' nextgroup=gtString
syn region gtDescBlock start="{" end="}" fold transparent contains=ALLBUT,gtHip,gtString

syn keyword gtBlockCmd RA Dec Distance AbsMag Mass nextgroup=gtNumber
syn keyword gtBlockCmd SpectralType nextgroup=gtDesc



let b:current_syntax = "gt"

hi def link gtTodo        Todo
hi def link gtComment     Comment
hi def link gtBlockCmd    Statement
hi def link gtHip         Type
hi def link gtString      Constant
hi def link gtDesc        PreProc
hi def link gtNumber      Constant
