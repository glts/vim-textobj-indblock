" textobj-indblock - Text objects for blocks of indentation whitespace
" Author: glts <676c7473@gmail.com>
" Date:   2013-02-01
" GetLatestVimScripts: 4348 1 :AutoInstall: textobj-indblock

if exists('g:loaded_textobj_indblock')
  finish
endif

call textobj#user#plugin('indblock', {
   \   '-': {
   \     'select-a': 'ao', '*select-a-function*': 'textobj#indblock#select_a',
   \     'select-i': 'io', '*select-i-function*': 'textobj#indblock#select_i',
   \   },
   \   'same': {
   \     'select-a': 'aO', '*select-a-function*': 'textobj#indblock#select_same_a',
   \     'select-i': 'iO', '*select-i-function*': 'textobj#indblock#select_same_i',
   \   }
   \ })

let g:loaded_textobj_indblock = 1
