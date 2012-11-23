" Maintainer:	Lars H. Nielsen (dengmao@gmail.com)
" Last Change:	January 22 2007

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "wombat"

hi CursorLine guibg=#001027
hi CursorColumn guibg=#001027
"hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
hi MatchParen guifg=#000000 guibg=#cae682 gui=bold
hi Pmenu 		guifg=#f6f3e8 guibg=#444444
hi PmenuSel 	guifg=#000000 guibg=#cae682
hi SignColumn guibg=#101010
hi TabLine guibg=#101010 guifg=#655b4f gui=none
hi TabLineFill guifg=#101010
hi TabLineSel guibg=#101010 guifg=dodgerblue4 gui=none

" General colors
"hi Cursor 		guifg=none    guibg=#656565 gui=none
hi Cursor 		guifg=NONE    guibg=#405067 gui=none
hi Normal 		guifg=#f6f3e8 guibg=#000000 gui=none
hi NonText 		guifg=#2a2a39 guibg=#000000 gui=none
hi LineNr 		guifg=#655b4f guibg=#101010 gui=none
hi StatusLine 	guifg=#857b6f guibg=#101010 gui=none
hi StatusLineNC guifg=#453b2f guibg=#101010 gui=none
hi FoldColumn   guifg=#453b2f guibg=#101010 gui=none
hi VertSplit 	guifg=#444444 guibg=#444444 gui=none
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		guifg=#f6f3e8 guibg=#242424 gui=none
hi SpecialKey	guifg=#2a2a39 guibg=#000000 gui=none

" Syntax highlighting
hi Comment 		guifg=#99968b gui=italic
hi Todo 		guifg=white gui=none guibg=#404000
hi Error 		guifg=white gui=none guibg=#400000
hi Constant 	guifg=darkred gui=none
hi String 		guifg=#95e454 gui=italic
hi Identifier 	guifg=#cae682 gui=none
hi Function 	guifg=#cae682 gui=none
hi Type 		guifg=#cae682 gui=none
hi Statement 	guifg=#8ac6f2 gui=none
hi Keyword		guifg=#8ac6f2 gui=none
hi PreProc 		guifg=#e5786d gui=none
hi Number		guifg=#e5786d gui=none
hi Special		guifg=#e7f6da gui=none
hi Underlined	term=underline cterm=underline ctermfg=darkblue gui=underline guifg=slateblue

hi Search guifg=white guibg=#606000 gui=none
hi IncSearch guifg=white guibg=#606000 gui=none
hi WildMenu guifg=white guibg=#606000 gui=none

hi ErrorMsg 		guifg=white gui=none guibg=#400000

" syntax hi links
hi link Character	Constant
hi link Boolean		Constant
hi link Float		Number
hi link Function	Identifier
hi link Conditional	Statement
hi link Repeat		Statement
hi link Label		Statement
hi link Keyword		Statement
hi link Exception	Statement
hi link Operator	Constant
hi link Include		PreProc
hi link Define		PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef		Type
hi link Tag		Underlined
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment	Special
hi link Debug		Special

