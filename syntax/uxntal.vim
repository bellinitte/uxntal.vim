" Vim syntax file
" Language:   Uxntal
" Maintainer: Karol Belina <karolbelina@gmail.com>
" Version:    0.2.0
" For bugs, patches and license visit https://github.com/karolbelina/uxntal.vim

if exists("b:current_syntax")
  finish
endif

syntax iskeyword @,33-255

syntax match uxntalComment "\S*" contained containedin=uxntalCommentRegion,uxntalMacroCommentRegion

syntax match uxntalImmediateReferenceLabel "[^/[:space:]]*" nextgroup=uxntalImmediateReferenceLabelSlash
syntax match uxntalImmediateReferenceLabelSlash "/" contained nextgroup=uxntalImmediateReferenceLabelSublabel
syntax match uxntalImmediateReferenceLabelSublabel "\S*" contained
highlight default link uxntalImmediateReferenceLabel uxntalReference
highlight default link uxntalImmediateReferenceLabelSlash uxntalRune
highlight default link uxntalImmediateReferenceLabelSublabel uxntalReference

syntax match uxntalRawNumber "\<\([0-9a-f]\{2\}\|[0-9a-f]\{4\}\)\>"
highlight default link uxntalRawNumber uxntalNumber

syntax match uxntalMnemonic "\<\(BRK\|\(LIT\|INC\|POP\|DUP\|NIP\|SWP\|OVR\|ROT\|EQU\|NEQ\|GTH\|LTH\|JMP\|JCN\|JSR\|STH\|LDZ\|STZ\|LDR\|STR\|LDA\|STA\|DEI\|DEO\|ADD\|SUB\|MUL\|DIV\|AND\|ORA\|EOR\|SFT\)[kr2]*\)\>"

syntax match uxntalIncludeRune "\<\~" nextgroup=uxntalInclude
syntax match uxntalInclude "\S*" contained
highlight default link uxntalIncludeRune uxntalRune

syntax match uxntalMacroDefintionHeaderRune "\<%" nextgroup=uxntalMacroDefintionHeader containedin=uxntalMacroCommentRegion
syntax match uxntalMacroDefintionHeader "\S*" contained
highlight default link uxntalMacroDefintionHeaderRune uxntalRune

syntax match uxntalPaddingRune "\<[|\$]" nextgroup=uxntalPaddingNumeric,uxntalPaddingLabeled
syntax match uxntalPaddingNumeric "[0-9a-f]*" contained
syntax match uxntalPaddingLabeled "\([0-9a-f]*\>\)\@!" contained nextgroup=uxntalPaddingLabel,uxntalPaddingScopedSublabelRune
syntax match uxntalPaddingLabel "[^/[:space:]]*" contained nextgroup=uxntalPaddingLabelSlash
syntax match uxntalPaddingLabelSlash "/" contained nextgroup=uxntalPaddingLabelSublabel
syntax match uxntalPaddingLabelSublabel "\S*" contained
syntax match uxntalPaddingScopedSublabelRune "&" contained nextgroup=uxntalPaddingScopedSublabel
syntax match uxntalPaddingScopedSublabel "\S*" contained
highlight default link uxntalPaddingRune uxntalRune
highlight default link uxntalPaddingNumeric uxntalNumber
highlight default link uxntalPaddingLabel uxntalReference
highlight default link uxntalPaddingLabelSlash uxntalRune
highlight default link uxntalPaddingLabelSublabel uxntalReference
highlight default link uxntalPaddingScopedSublabelRune uxntalRune
highlight default link uxntalPaddingScopedSublabel uxntalReference

syntax match uxntalLabelRune "\<@" nextgroup=uxntalLabel
syntax match uxntalLabel "[^/[:space:]]*" contained nextgroup=uxntalLabelSlash
syntax match uxntalLabelSlash "/" contained nextgroup=uxntalLabelSublabel
syntax match uxntalLabelSublabel "\S*" contained
highlight default link uxntalLabelRune uxntalRune
highlight default link uxntalLabelSlash uxntalRune
highlight default link uxntalLabelSublabel uxntalLabel

syntax match uxntalScopedSublabelRune "\<&" nextgroup=uxntalScopedSublabel
syntax match uxntalScopedSublabel "\S*" contained
highlight default link uxntalScopedSublabelRune uxntalRune
highlight default link uxntalScopedSublabel uxntalLabel

syntax match uxntalLiteralNumberRune "\<#" nextgroup=uxntalLiteralNumber
syntax match uxntalLiteralNumber "\S*" contained
highlight default link uxntalLiteralNumberRune uxntalRune

syntax match uxntalReferenceRune "\<[.,:;\-=_!?]" nextgroup=uxntalReferenceLabel,uxntalReferenceScopedSublabelRune,uxntalAnonymousLabel
syntax match uxntalReferenceLabel "[^/[:space:]]*" contained nextgroup=uxntalReferenceLabelSlash
syntax match uxntalReferenceLabelSlash "/" contained nextgroup=uxntalReferenceLabelSublabel
syntax match uxntalReferenceLabelSublabel "\S*" contained
syntax match uxntalReferenceScopedSublabelRune "&" contained nextgroup=uxntalReferenceScopedSublabel
syntax match uxntalReferenceScopedSublabel "\S*" contained
syntax match uxntalAnonymousLabel "{\S*" contained
highlight default link uxntalReferenceRune uxntalRune
highlight default link uxntalReferenceLabel uxntalReference
highlight default link uxntalReferenceLabelSlash uxntalRune
highlight default link uxntalReferenceLabelSublabel uxntalReference
highlight default link uxntalReferenceScopedSublabelRune uxntalRune
highlight default link uxntalReferenceScopedSublabel uxntalReference
highlight default link uxntalAnonymousLabel uxntalRune

syntax match uxntalStringRune "\<\"" nextgroup=uxntalString
syntax match uxntalString "\S*" contained
highlight default link uxntalStringRune uxntalRune

syntax match uxntalBracket "\<[\[\]]\>"
highlight default link uxntalBracket uxntalRune

syntax match uxntalBrace "\<[{}]\S*"
highlight default link uxntalBrace uxntalRune

syntax region uxntalCommentRegion matchgroup=uxntalComment start="\<(\S*" end="\<)\>" fold
syntax region uxntalCommentRegion matchgroup=uxntalComment start="\<(\>" end="\<)\>" fold contained containedin=uxntalCommentRegion

syntax region uxntalMacroDefintionRegion start="\<%\S*" end="\<}\S*" fold keepend transparent
syntax region uxntalMacroCommentRegion matchgroup=uxntalComment start="\<(\S*" end="\<)\>" matchgroup=uxntalBrace end="\<}\S*" fold contained containedin=uxntalMacroDefintionRegion
syntax region uxntalMacroCommentRegion matchgroup=uxntalComment start="\<(\>" end="\<)\>" matchgroup=uxntalBrace end="\<}\S*" fold contained containedin=uxntalMacroCommentRegion

highlight default link uxntalRune                    Operator
highlight default link uxntalComment                 Comment
highlight default link uxntalMacroDefintionHeader    Special
highlight default link uxntalInclude                 String
highlight default link uxntalPadding                 Number
highlight default link uxntalLabel                   Function
highlight default link uxntalLiteralNumber           Number
highlight default link uxntalReference               Type
highlight default link uxntalString                  String
highlight default link uxntalMnemonic                Keyword
highlight default link uxntalNumber                  Number

let b:current_syntax = "uxntal"
