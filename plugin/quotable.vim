" ============================================================================
" File:        quotable.vim
" Description: vim-quotable plugin
" Maintainer:  Reed Esau <github.com/reedes>
" Last Change: December 25, 2013
" License:     The MIT License (MIT)
" ============================================================================

scriptencoding utf-8

if exists('g:loaded_quotable') || &cp | finish | endif
let g:loaded_quotable = 1

" Save 'cpoptions' and set Vim default to enable line continuations.
let s:save_cpo = &cpo
set cpo&vim

let g:quotable#doubleStandard = '“”'
let g:quotable#singleStandard = '‘’'

if !exists('g:quotable#doubleMotion')
  let g:quotable#doubleMotion = 'q'
endif
if !exists('g:quotable#singleMotion')
  let g:quotable#singleMotion = 'Q'
endif

if !exists('g:quotable#doubleDefault')
  "  “double”
  let g:quotable#doubleDefault = g:quotable#doubleStandard
endif
if !exists('g:quotable#singleDefault')
  "  ‘single’
  let g:quotable#singleDefault = g:quotable#singleStandard
endif

if !exists('g:quotable#educateQuotesDefault')
  " by default, translate "straight quotes" to “typographical quotes”
  let g:quotable#educateQuotesDefault = 1
endif

" needed to match pairs of quotes (via tpope/vim-sensible)
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" commands
command -nargs=0 QuotableEducateOn  call quotable#mapKeysToEducate(1)<cr>
command -nargs=0 QuotableEducateOff  call quotable#mapKeysToEducate(0)<cr>
command -nargs=0 QuotableEducateToggle  call quotable#educateToggle()<cr>

" a simple alterative to tpope/vim-surround
nnoremap <Plug>QuotableSurroundDouble :call quotable#surround(1, '')<cr>
vnoremap <Plug>QuotableSurroundDouble :<C-u>call quotable#surround(1, visualmode())<cr>
nnoremap <Plug>QuotableSurroundSingle :call quotable#surround(0, '')<cr>
vnoremap <Plug>QuotableSurroundSingle :<C-u>call quotable#surround(0, visualmode())<cr>

let &cpo = s:save_cpo
unlet s:save_cpo
" vim:ts=2:sw=2:sts=2