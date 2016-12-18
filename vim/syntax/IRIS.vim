" Vim syntax file
" Language: IRIS_ Pipeline Language
" Maintainer: Jay Kuri
" Latest Revision: December 6, 2016

if exists("b:current_syntax")
  finish
endif
syntax case match


syn region IRIS_interpreted_strings start="\"" skip=/\\"/ end="\"" 
syn region IRIS_strings start="\'" skip=/\\'/ end="\'" containedin=ALLBUT,IRIS_interpreted_strings,IRIS_strings,IRIS_comment
syn region IRIS_strings start="\`" skip=/\\`/ end="\`" containedin=ALLBUT,IRIS_interpreted_strings,IRIS_strings,IRIS_comment
syn keyword IRIS_IRIS IRIS
syn match IRIS_openingTag /<!--.*$/ contains=IRIS_IRIS
syn match IRIS_closingTag /-->/ containedin=NONE

syn match IRIS_variable /\$[a-zA-Z0-9_\.\[\]]\+/ containedin=IRIS_interpreted_strings
syn match IRIS_operators /[=><!\+\-\/\*|&]\+/ containedin=IRIS_interpreted_strings
syn match IRIS_numbers /[\+\-]\?[0-9][0-9\.]\+/ containedin=IRIS_interpreted_strings
syn keyword IRIS_boolean true false containedin=IRIS_interpreted_strings
" flag variable usage inside constant strings 
syn match IRIS_illegal_variable /\$[a-zA-Z0-9_\.\[\]]\+/ containedin=IRIS_strings
syn region IRIS_unused matchgroup=IRIS_function_call start=/[a-zA-Z0-9_]\+(/ end=/)/ containedin=IRIS_interpreted_strings transparent

syn keyword IRIS_pipelineKeyword pipeline 
syn keyword IRIS_exceptionKeyword exception 
syn region IRIS_Block matchgroup=IRIS_parens start="(" skip="|.\{-}|" end=")" transparent skipwhite skipnl fold

syn match IRIS_componentName /[\._a-zA-Z0-9]\+/ nextgroup=IRIS_Block contains=NONE skipwhite skipnl
syn match IRIS_logComponent /.Log/ nextgroup=IRIS_Block skipwhite skipnl
syn match IRIS_dieComponent /.Die/ nextgroup=IRIS_Block skipwhite skipnl
"syn match IRIS_argName "/[a-zA-Z0-9_\-]\+/" skipwhite skipnl
syn region IRIS_none matchgroup=IRIS_argName start=/[a-zA-Z0-9_]\+(/ end=/)/  transparent

syn keyword IRIS_repeatKeywords with as 
syn keyword IRIS_repeatKeywords repeat do 
syn keyword IRIS_conditionalKeywords then else elseif if 
syn keyword IRIS_conditionalKeywords expr 
syn keyword IRIS_controlKeywords break continue
syn keyword IRIS_nameKeyword name 

syn region IRIS_comment start=/\/\// end=/$/ contains=@Spell oneline
syn region IRIS_comment start=/\/\*/  end=/\*\// contains=@Spell fold 

highlight link IRIS_pipelineKeyword Keyword
highlight link IRIS_exceptionKeyword Exception
highlight link IRIS_repeatKeywords Repeat
highlight link IRIS_conditionalKeywords Conditional
highlight link IRIS_controlKeywords Label
highlight link IRIS_strings Character
highlight link IRIS_interpreted_strings String
highlight link IRIS_comment Comment
highlight link IRIS_componentName Function
highlight link IRIS_logComponent Debug  
highlight link IRIS_dieComponent Exception  
highlight link IRIS_argName Tag
highlight link IRIS_nameKeyword Constant
highlight link IRIS_parens Delimiter

highlight link IRIS_openingTag Comment
highlight link IRIS_closingTag Comment
highlight link IRIS_IRIS Keyword
highlight link IRIS_Block Todo
highlight link IRIS_variable Identifier
highlight link IRIS_operators Operator
highlight link IRIS_numbers Number
highlight link IRIS_illegal_variable Error
highlight link IRIS_function_call Macro

let b:current_syntax = "IRIS"
