" Vim syntax file
" Language:   Uxntal
" Maintainer: Karol Belina <karolbelina@gmail.com>
" Version:    v0.1.2
" For bugs, patches and license visit https://github.com/karolbelina/uxntal.vim

if exists("b:current_syntax")
  finish
endif

syntax iskeyword @,33-255

syntax match uxntalComment "\S*" contained containedin=uxntalCommentRegion,uxntalMacroCommentRegion

syntax match uxntalMacro display "\<\S\+"
syntax match uxntalRawNumber "\<\([0-9a-f]\{2\}\|[0-9a-f]\{4\}\)\>"
syntax match uxntalMnemonic "\<\(BRK\|\(LIT\|INC\|POP\|DUP\|NIP\|SWP\|OVR\|ROT\|EQU\|NEQ\|GTH\|LTH\|JMP\|JCN\|JSR\|STH\|LDZ\|STZ\|LDR\|STR\|LDA\|STA\|DEI\|DEO\|ADD\|SUB\|MUL\|DIV\|AND\|ORA\|EOR\|SFT\)[kr2]*\)\>"

syntax match uxntalIncludeRune "\<\~" nextgroup=uxntalInclude
syntax match uxntalInclude "\S*" contained
highlight default link uxntalIncludeRune uxntalRune

syntax match uxntalMacroDefintionHeaderRune "\<%" nextgroup=uxntalMacroDefintionHeader containedin=uxntalMacroCommentRegion
syntax match uxntalMacroDefintionHeader "\S*" contained
highlight default link uxntalMacroDefintionHeaderRune uxntalRune

syntax match uxntalMacroDefintionBrace "\<[{}]\S*" contained containedin=uxntalMacroDefintionRegion
highlight default link uxntalMacroDefintionBrace uxntalRune

syntax match uxntalPadRune "\<[|\$]" nextgroup=uxntalPad
syntax match uxntalPad "\S*" contained
highlight default link uxntalPadRune uxntalRune

syntax match uxntalLabelRune "\<@" nextgroup=uxntalLabel
syntax match uxntalLabel "[^/[:space:]]*" contained nextgroup=uxntalLabelSlash
syntax match uxntalLabelSlash "/" contained nextgroup=uxntalLabelSublabel
syntax match uxntalLabelSublabel "\S*" contained
highlight default link uxntalLabelRune uxntalRune
highlight default link uxntalLabelSlash uxntalRune

syntax match uxntalScopedSublabelRune "\<&" nextgroup=uxntalScopedSublabel
syntax match uxntalScopedSublabel "\S*" contained
highlight default link uxntalScopedSublabelRune uxntalRune

syntax match uxntalLiteralNumberRune "\<#" nextgroup=uxntalLiteralNumber
syntax match uxntalLiteralNumber "\S*" contained
highlight default link uxntalLiteralNumberRune uxntalRune

syntax match uxntalReferenceRune "\<[.,:;]" nextgroup=uxntalReferenceLabel,uxntalReferenceScopedSublabelRune
syntax match uxntalReferenceLabel "[^/[:space:]]*" contained nextgroup=uxntalReferenceLabelSlash
syntax match uxntalReferenceLabelSlash "/" contained nextgroup=uxntalReferenceLabelSublabel
syntax match uxntalReferenceLabelSublabel "\S*" contained
syntax match uxntalReferenceScopedSublabelRune "&" contained nextgroup=uxntalReferenceScopedSublabel
syntax match uxntalReferenceScopedSublabel "\S*" contained
highlight default link uxntalReferenceRune uxntalRune
highlight default link uxntalReferenceLabelSlash uxntalRune
highlight default link uxntalReferenceScopedSublabelRune uxntalRune

syntax match uxntalStringRune "\<\"" nextgroup=uxntalString
syntax match uxntalString "\S*" contained
highlight default link uxntalStringRune uxntalRune

syntax match uxntalBracket "\<[\[\]]\>"
highlight default link uxntalBracket uxntalRune

syntax region uxntalCommentRegion matchgroup=uxntalComment start="\<(\S*" end="\<)\>" fold
syntax region uxntalCommentRegion matchgroup=uxntalComment start="\<(\>" end="\<)\>" fold contained containedin=uxntalCommentRegion

syntax region uxntalMacroDefintionRegion start="\<%\S*" end="\<}\S*" fold keepend transparent
syntax region uxntalMacroCommentRegion matchgroup=uxntalComment start="\<(\S*" end="\<)\>" matchgroup=uxntalMacroDefintionBrace end="\<}\S*" fold contained containedin=uxntalMacroDefintionRegion
syntax region uxntalMacroCommentRegion matchgroup=uxntalComment start="\<(\>" end="\<)\>" matchgroup=uxntalMacroDefintionBrace end="\<}\S*" fold contained containedin=uxntalMacroCommentRegion

highlight default link uxntalRune                    Operator
highlight default link uxntalComment                 Comment
highlight default link uxntalMacroDefintionHeader    Special
highlight default link uxntalInclude                 String
highlight default link uxntalPad                     Number
highlight default link uxntalLabel                   Function
highlight default link uxntalLabelSublabel           Function
highlight default link uxntalScopedSublabel          Function
highlight default link uxntalLiteralNumber           Number
highlight default link uxntalReferenceLabel          Type
highlight default link uxntalReferenceLabelSublabel  Type
highlight default link uxntalReferenceScopedSublabel Type
highlight default link uxntalString                  String
highlight default link uxntalMnemonic                Keyword
highlight default link uxntalRawNumber               Number
highlight default link uxntalMacro                   Macro

let b:current_syntax = "uxntal"
