" Vim syntax file
" Language:     MoinMoin
" Maintainer:   Michael Lamertz <mike@perl-ronin.de>
" Contributors: David O'Callaghan <david.ocallaghan@cs.tcd.ie>
"               Tony Garland <Tony.Garland@fluke.com>
" Last Change:  05-Mar-2013.4 2005/04/28 08:14:19 mlamertz Exp $

" Bugs:         Parsing of mixed bold-italic not yet implemented
"               Tables not yet implemented

if exists("b:current_syntax")
  finish
endif

" headings
syntax match  moinHeader          /\v^(\={1,6})\s+.*(\s+\1\s*(#.+)?)?$/

" inline markup
syntax match  moinItalic          /\('\{2}\)[^']\+\1/
syntax match  moinBold            /\('\{3}\)[^']\+\1/
syntax match  moinBoldItalic      /\('\{5}\)[^']\+\1/
syntax match  moinUnderline       /\(_\{2}\).\{-}\1/
syntax match  moinSubscript       /\(,\{2}\).\{-}\1/
syntax match  moinSuperscript     /\(\^\).\{-}\1/
syntax match  moinTypewriter      /\(`\).\{-}\1/
syntax match  moinMacro           /\[\{2}.\{-}\]\{2}/
syntax match  moinDel             /\(\~\{2}\)[^~]\+\1/

" Codeblocks
syntax region moinPreformatted    start=/{{{/ end=/}}}/

" Links
syntax match  moinWikiWord        /\(\w\+:\)\?\u[a-z0-9]\+\u[a-z0-9]\+\(\u[a-z0-9]\+\)*/
syntax match  moinBracketLink     /\[[^[\]]\+\]/
syntax match  moinSubLink         /\(\w\+\|\.\.\)\?\// nextgroup=moinWikiWord
syntax match  moinNormalURL       /\w\+:\/\/\S\+/
syntax match  moinEmail           /\S\+@\S\+/

" lists
syntax match  moinBulletList      /^\(\s\+\)\zs\*\ze\s/
syntax match  moinNumberedList    /^\(\s\+\)\zs1\.\ze\s/
syntax match  moinAlphalist       /^\(\s\+\)\zsa\.\ze\s/
syntax match  moinRomanlist       /^\(\s\+\)\zsi\.\ze\s/
syntax match  moinBigromanlist    /^\(\s\+\)\zsI\.\ze\s/
syntax match  moinDescriptionlist /^\(\s\+\)\zs.\{-}::\ze\s/

" rules
syntax match  moinRule            /^-\{4,}/

" comments/pragmas
syntax match  moinComment         /^##.*$/
syntax match  moinPragma          /^#\w\+.*$/

" Define the default highlighting.
command -nargs=+ HighlightLink highlight def link <args>

HighlightLink moinHeader          Function

HighlightLink moinItalic          Identifier
HighlightLink moinBold            Identifier
HighlightLink moinBoldItalic      Identifier
HighlightLink moinUnderline       Identifier
HighlightLink moinSubscript       Identifier
HighlightLink moinSuperscript     Identifier
HighlightLink moinTypewriter      Identifier
HighlightLink moinMacro           Define
HighlightLink moinPragma          Define
HighlightLink moinDel             Comment

HighlightLink moinPreformatted    String

HighlightLink moinWikiWord        Statement
HighlightLink moinBracketLink     Statement
HighlightLink moinNormalURL       Statement
HighlightLink moinSubLink         Statement
HighlightLink moinInterLink       Statement
HighlightLink moinEmail           Statement

HighlightLink moinBulletList      Type
HighlightLink moinNumberedList    Type
HighlightLink moinAlphalist       Type
HighlightLink moinRomanlist       Type
HighlightLink moinBigromanlist    Type
HighlightLink moinDescriptionlist Type

HighlightLink moinRule            Special

HighlightLink moinComment         Comment

delcommand HighlightLink

let b:current_syntax = "moin"
