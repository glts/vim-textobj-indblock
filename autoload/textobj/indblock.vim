" textobj-indblock - Text objects for blocks of indentation whitespace
" Author:  glts <676c7473@gmail.com>
" Date:    2012-12-08

let s:save_cpo = &cpo
set cpo&vim

function! s:Select(include_blank, same_indent)

  let cursor_line = line('.')

  " Search forward for a line with indent
  if indent(cursor_line) == 0
    let next_line = cursor_line
    while indent(next_line) == 0
      if next_line == line('$')
        return 0
      endif
      let next_line += 1
    endwhile
    let cursor_line = next_line
  endif

  let ind_width = indent(cursor_line)

  " Find top and bottom line for block
  let top_line = cursor_line
  while top_line > 0
    if s:IsExpansible(top_line-1, ind_width, a:include_blank, a:same_indent)
      let top_line -= 1
    else
      break
    endif
  endwhile

  let bottom_line = cursor_line
  let last_line = line('$')
  while bottom_line < last_line
    if s:IsExpansible(bottom_line+1, ind_width, a:include_blank, a:same_indent)
      let bottom_line += 1
    else
      break
    endif
  endwhile

  " Calculate indent column (in bytes) and screen column offset
  let [ind_col, offset] = s:GetIndentColOffset(ind_width, matchstr(getline(bottom_line), '^\s*'))

  return [ "\<C-V>",
        \ [0, top_line, 1, 0],
        \ [0, bottom_line, ind_col, offset] ]
endfunction

function! s:IsExpansible(line, indent, include_blank, same_indent)
  if a:same_indent
    return a:include_blank
         \ ? (s:IsBlank(a:line) || indent(a:line) == a:indent)
         \ : indent(a:line) == a:indent
  else
    return a:include_blank
         \ ? (s:IsBlank(a:line) || indent(a:line) >= a:indent)
         \ : indent(a:line) >= a:indent
  endif
endfunction

function! s:IsBlank(line)
  return getline(a:line) =~# '^\s*$'
endfunction

function! s:GetIndentColOffset(ind_width, ind_string)
  let ind_col = 0
  let ind_virtcol = 0
  let char_width = 1

  for char in split(a:ind_string, '\zs')
    let ind_virtcol += char_width - 1
    let char_width = (char =~# '\t' ? (&tabstop - (ind_virtcol % &tabstop)) : 1)
    let ind_col += 1
    let ind_virtcol += 1
    if (ind_virtcol + char_width) > a:ind_width
      break
    endif
  endfor
  let ind_virtcol = !ind_virtcol ? 1 : ind_virtcol

  let offset = a:ind_width - ind_virtcol

  return [ind_col ? ind_col : 1, offset]
endfunction

function! textobj#indblock#select_a()
  return s:Select(1, 0)
endfunction

function! textobj#indblock#select_i()
  return s:Select(0, 0)
endfunction

function! textobj#indblock#select_same_a()
  return s:Select(1, 1)
endfunction

function! textobj#indblock#select_same_i()
  return s:Select(0, 1)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
