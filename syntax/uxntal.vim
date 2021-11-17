" Vim syntax file
" Language:   Uxntal
" Maintainer: Karol Belina <karolbelina@gmail.com>
" Version:    v0.1.2
" For bugs, patches and license visit https://github.com/karolbelina/uxntal.vim

if exists("b:current_syntax")
  finish
endif

syntax iskeyword @,33-255

syntax match uxntalMacro display "\<\S\+"

syntax match uxntalMacro "\<%\S*"hs=s+1

syntax match uxntalBracket "\<\({\|}\|\[\|\]\|)\)\S*"

syntax match uxntalLabel "\<@[^/[:space:]]*"hs=s+1 nextgroup=uxntalLabel
syntax match uxntalLabel "/\S*"hs=s+1 contained

syntax match uxntalSublabel "\<&\S*"hs=s+1

syntax match uxntalAddressLabel "\<[.,:;][^/[:space:]]*"hs=s+1 nextgroup=uxntalAddressLabel
syntax match uxntalAddressLabel "/\S*"hs=s+1 contained

syntax match uxntalAddressSublabel "\<[.,:;]&\S*"hs=s+2

syntax match uxntalString "\<\"\S*"hs=s+1

syntax match uxntalChar "\<'\S*"hs=s+1

syntax match uxntalNumber "\<\(#\||\|\$\)\S*"hs=s+1
syntax match uxntalNumber "\<\([0-9a-f]\{2\}\|[0-9a-f]\{4\}\)\>"

syntax match uxntalInclude "\<\~\S*"hs=s+1

syntax match uxntalMnemonic "\<BRK\>"
syntax match uxntalMnemonic "\<\(LIT\|INC\|POP\|DUP\|NIP\|SWP\|OVR\|ROT\|EQU\|NEQ\|GTH\|LTH\|JMP\|JCN\|JSR\|STH\|LDZ\|STZ\|LDR\|STR\|LDA\|STA\|DEI\|DEO\|ADD\|SUB\|MUL\|DIV\|AND\|ORA\|EOR\|SFT\)[kr2]*\>"

syntax region uxntalComment start="\<(\S*" end="\<)\S*"

highlight default link uxntalMacro           Macro
highlight default link uxntalLabel           Function
highlight default link uxntalSublabel        uxntalLabel
highlight default link uxntalAddressLabel    Type
highlight default link uxntalAddressSublabel uxntalAddressLabel
highlight default link uxntalString          String
highlight default link uxntalChar            Character
highlight default link uxntalNumber          Number
highlight default link uxntalInclude         Constant
highlight default link uxntalMnemonic        Keyword
highlight default link uxntalComment         Comment

let b:current_syntax = "uxntal"
