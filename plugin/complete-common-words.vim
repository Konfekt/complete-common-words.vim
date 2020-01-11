if exists('g:loaded_complete_common_words_dict') || &cp
  finish
endif
let g:loaded_complete_common_words_dict = 1

let s:keepcpo         = &cpo
set cpo&vim
" ------------------------------------------------------------------------------

scriptencoding utf-8

if !has('spell')
  finish
endif

if !exists('g:common_words_dicts_dir')
  let s:dotfiles = split(&runtimepath, ',')[0]
  let g:common_words_dicts_dir = s:dotfiles . '/dicts'
  unlet s:dotfiles
endif

if !isdirectory(g:common_words_dicts_dir)
  echoerr "complete-common-words: please set g:common_words_dicts_dir to the folder that contains the dictionary files or put them into the folder " . g:common_words_dicts_dir
  finish
endif

function! s:dict(lang) abort
  let lang = a:lang

  if empty(lang)
    if exists('b:dictionary')
      let &l:dictionary = b:dictionary
    endif
    setlocal complete-=k

    return
  endif

  if exists('b:dictionary')
    let &l:dictionary = b:dictionary
  else
    let b:dictionary = &l:dictionary
  endif

  let common = g:common_words_dicts_dir . '/' . lang . '_common.dict'
  if filereadable(expand(common))
    execute 'setlocal dictionary+=' . common
  endif
  " Must come last to list more common words first => Remove first!
  setlocal dictionary+=spell
  " replace file dictionary completion by built-in spell-check dictionary  
  execute 'setlocal dictionary-=' . &g:dictionary
  setlocal complete+=k
endf

function! SetCommonWordsDict(new_lang) abort
  let lang_pattern = '\v(^|,)\zs\a\a\ze(_\a\a)?($|,)'

  let new_lang = tolower(matchstr(a:new_lang, lang_pattern))
  let new_lang = substitute(new_lang, '\s', '', 'g')

  if !empty(new_lang)
    call s:dict(new_lang)
  endif
endfunction

augroup CommonWordsDict
  autocmd!
  if exists('##OptionSet')
    autocmd OptionSet spelllang
          \ let b:common_words_explicit = 1 |
          \ call SetCommonWordsDict(v:option_new)
    autocmd OptionSet spell
        \ if &spell && !empty(&spelllang) && !exists('b:common_words_explicit') |
        \   call SetCommonWordsDict(&spelllang) |
        \ endif
  endif
  autocmd BufWinEnter *
        \ if &spell && !empty(&spelllang) && !exists('b:common_words_explicit') |
        \   call SetCommonWordsDict(&spelllang) |
        \ endif
augroup end
if argc() > 1
  silent doautocmd CommonWordsDict BufWinEnter
endif

" ------------------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo
