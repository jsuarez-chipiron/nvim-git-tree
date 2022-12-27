" Vim syntax file
" Language: Git Tree
" Maintainer: Javier Suarez
" Latest Revision: 26 Dec 2022

if exists("b:current_syntax")
  finish
endif

syntax match gtMerge /\[MERGE\]/
syntax match gtCommit /[a-f0-9]\{7,15}/
syntax match gtBranch /(.\{-})/
syntax match gtDate /(Mon, [0-9].*)/
syntax match gtDate /(Tue, [0-9].*)/
syntax match gtDate /(Wed, [0-9].*)/
syntax match gtDate /(Thu, [0-9].*)/
syntax match gtDate /(Fri, [0-9].*)/
syntax match gtDate /(Sat, [0-9].*)/
syntax match gtDate /(Sun, [0-9].*)/
syntax match gtCommit /[a-f0-9]\{7,15}/
syntax match gtAuthor /<.*>$/

let b:current_syntax = "gt"

hi def link gtMerge Identifier
hi def link gtCommit String
hi def link gtDate Type
hi def link gtAuthor Function
hi def link gtBranch Statement
