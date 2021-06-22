" Vim syntax file
" Language: Uxntal
" Maintainer: Karol Belina
" Version: v0.1.0

if exists("b:current_syntax")
  finish
endif

syntax iskeyword @,33-39,42-90,92,94-122,124,126-255

syntax match talMacro display "\<\k\+\>"

syntax match talIdentifier display "\<\.\k*\>"
syntax match talIdentifier display "\<\,\k*\>"
syntax match talIdentifier display "\<\:\k*\>"
syntax match talIdentifier display "\<\;\k*\>"

syntax match talLabel display "\<@\k*\>"
syntax match talLabel display "\<&\k*\>"

syntax match talString display "\"\S*"
syntax match talString display "'\S*"

syntax match talMacro display "%\k*"

syntax match talKeyword display "\<BRK\(k\|r\|2\)*\>"
syntax match talKeyword display "\<LIT\(k\|r\|2\)*\>"
syntax match talKeyword display "\<NOP\(k\|r\|2\)*\>"
syntax match talKeyword display "\<POP\(k\|r\|2\)*\>"
syntax match talKeyword display "\<DUP\(k\|r\|2\)*\>"
syntax match talKeyword display "\<SWP\(k\|r\|2\)*\>"
syntax match talKeyword display "\<OVR\(k\|r\|2\)*\>"
syntax match talKeyword display "\<ROT\(k\|r\|2\)*\>"
syntax match talKeyword display "\<EQU\(k\|r\|2\)*\>"
syntax match talKeyword display "\<NEQ\(k\|r\|2\)*\>"
syntax match talKeyword display "\<GTH\(k\|r\|2\)*\>"
syntax match talKeyword display "\<LTH\(k\|r\|2\)*\>"
syntax match talKeyword display "\<JMP\(k\|r\|2\)*\>"
syntax match talKeyword display "\<JCN\(k\|r\|2\)*\>"
syntax match talKeyword display "\<JSR\(k\|r\|2\)*\>"
syntax match talKeyword display "\<STH\(k\|r\|2\)*\>"
syntax match talKeyword display "\<LDZ\(k\|r\|2\)*\>"
syntax match talKeyword display "\<STZ\(k\|r\|2\)*\>"
syntax match talKeyword display "\<LDR\(k\|r\|2\)*\>"
syntax match talKeyword display "\<STR\(k\|r\|2\)*\>"
syntax match talKeyword display "\<LDA\(k\|r\|2\)*\>"
syntax match talKeyword display "\<STA\(k\|r\|2\)*\>"
syntax match talKeyword display "\<DEI\(k\|r\|2\)*\>"
syntax match talKeyword display "\<DEO\(k\|r\|2\)*\>"
syntax match talKeyword display "\<ADD\(k\|r\|2\)*\>"
syntax match talKeyword display "\<SUB\(k\|r\|2\)*\>"
syntax match talKeyword display "\<MUL\(k\|r\|2\)*\>"
syntax match talKeyword display "\<DIV\(k\|r\|2\)*\>"
syntax match talKeyword display "\<AND\(k\|r\|2\)*\>"
syntax match talKeyword display "\<ORA\(k\|r\|2\)*\>"
syntax match talKeyword display "\<EOR\(k\|r\|2\)*\>"
syntax match talKeyword display "\<SFT\(k\|r\|2\)*\>"

syntax match talHexInt display "\<#[0-9a-f]*\>"
syntax match talHexInt display "\<|[0-9a-f]*\>"
syntax match talHexInt display "\<$[0-9a-f]*\>"
syntax match talHexInt display "\<[0-9a-f]\{2\}\>"
syntax match talHexInt display "\<[0-9a-f]\{4\}\>"

syntax keyword talCommentTodo contained TODO FIXME NOTE XXX

syntax region talComment start="(" end=")" contains=talCommentTodo,talComment

highlight default link talKeyword     Keyword
highlight default link talLabel       Function
highlight default link talIdentifier  Type
highlight default link talHexInt      Number
highlight default link talString      String
highlight default link talMacro       Macro
highlight default link talComment     Comment
highlight default link talCommentTodo Todo

let b:current_syntax = "uxntal"
