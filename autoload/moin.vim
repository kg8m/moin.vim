" http://qiita.com/items/449833fa90cc5b5c13c0
function! moin#fold_heading(lnum) abort  " {{{
  let line  = getline(a:lnum)
  let match = matchstr(line, '\v^\zs(\={1,6})\ze\s+.*(\s+\1\s*(#.+)?)?$')

  if len(match) <= 1
    return "="
  else
    return ">" . (len(match) - 1)
  endif
endfunction  " }}}
