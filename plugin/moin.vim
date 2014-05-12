" http://qiita.com/items/449833fa90cc5b5c13c0
au FileType moin setl foldmethod=expr foldexpr=FoldMoinHeading(v:lnum)

function! FoldMoinHeading(lnum)
  let line = getline(a:lnum)
  let match = matchstr(line, '^\zs\(=\{1,6}\)\ze\s\+.*\s\+\1\s*\(#.\+\)\=$')
  if len(match) <= 1
      return '='
  else
      return '>' . (len(match) - 1)
  endif
endfunction
