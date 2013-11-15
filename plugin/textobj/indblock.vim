" textobj-indblock - Text objects for blocks of indentation whitespace
" Author: glts <676c7473@gmail.com>
" Date: 2013-11-15
" GetLatestVimScripts: 2100 1 textobj-user
" GetLatestVimScripts: 4348 1 :AutoInstall: textobj-indblock

if exists('g:loaded_textobj_indblock')
  finish
endif

if exists(':NeoBundleDepends') == 2
  NeoBundleDepends 'kana/vim-textobj-user'
endif

call textobj#user#plugin('indblock', {
     \   '-': {
     \     'select-a-function': 'textobj#indblock#select_a',
     \     'select-a': 'ao',
     \     'select-i-function': 'textobj#indblock#select_i',
     \     'select-i': 'io',
     \   },
     \   'same': {
     \     'select-a-function': 'textobj#indblock#select_same_a',
     \     'select-a': 'aO',
     \     'select-i-function': 'textobj#indblock#select_same_i',
     \     'select-i': 'iO',
     \   }
     \ })

let g:loaded_textobj_indblock = 1
