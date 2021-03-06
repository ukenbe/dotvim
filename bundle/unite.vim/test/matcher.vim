let s:suite = themis#suite('parser')
let s:assert = themis#helper('assert')

function! s:suite.before_each()
  let g:fuzzy_save = 20
endfunction
function! s:suite.after_each()
  let g:unite_matcher_fuzzy_max_input_length = g:fuzzy_save
endfunction

function! s:suite.lua()
  if !has('lua')
    return
  endif
  call unite#filters#matcher_fuzzy#define()

  let g:unite_matcher_fuzzy_max_input_length = 20
  call s:assert.equals(unite#filters#lua_matcher(
        \ [{'word' : 'foo'}], { 'input' : 'foo' }, 0), [{'word' : 'foo'}])
  call s:assert.equals(unite#filters#lua_matcher(
        \ [{'word' : 'foo'}], { 'input' : 'bar' }, 0), [])
  call s:assert.equals(unite#filters#lua_matcher(
        \ [{'word' : 'Foo'}], { 'input' : 'foo'}, 0), [])
  call s:assert.equals(unite#filters#lua_matcher(
        \ [{'word' : 'Foo'}], { 'input' : 'foo'}, 1), [{'word' : 'Foo'}])
  call s:assert.equals(unite#filters#lua_matcher(
        \ [{'word' : 'Foo'}, {'word' : 'Bar'}],
        \  {'input' : 'foo'}, 1), [{'word' : 'Foo'}])
  call s:assert.equals(unite#filters#lua_matcher(
        \ [{'word' : 'foo'}, {'word' : 'bar'},
        \  {'word' : 'foobar'}, {'word' : 'baz'}],
        \ {'input' : 'foo'}, 0), [{'word' : 'foo'}, {'word' : 'foobar'}])
  call s:assert.equals(unite#filters#lua_fuzzy_matcher(
        \ [{'word' : '/Users/core.cljs'}, {'word' : '/Users/core.js'}],
        \ { 'input' : 'cl' }, 0), [{'word' : '/Users/core.cljs'}])
  call s:assert.equals(unite#filters#lua_fuzzy_matcher(
        \ [{'word' : '/Users/core.cljs'}, {'word' : '/Users/core.js'}],
        \ { 'input' : 'co' }, 0),
        \ [{'word' : '/Users/core.cljs'}, {'word' : '/Users/core.js'}])
  call s:assert.equals(unite#filters#lua_fuzzy_matcher(
        \ [{'word' : '/Users/core.cljs'}, {'word' : '/Users/core.js'}],
        \ { 'input' : '/U' }, 0),
        \ [{'word' : '/Users/core.cljs'}, {'word' : '/Users/core.js'}])
  call s:assert.equals(unite#filters#lua_fuzzy_matcher(
        \ [{'word' : '/Users/core.cljs'}, {'word' : '/Users/core.js'}],
        \ { 'input' : '/Us' }, 0),
        \ [{'word' : '/Users/core.cljs'}, {'word' : '/Users/core.js'}])
  call s:assert.equals(unite#filters#lua_fuzzy_matcher(
        \ [{'word' : '/unite/sources/find.vim'}],
        \ { 'input' : '/u/s/f' }, 0), [{'word' : '/unite/sources/find.vim'}])
  call s:assert.equals(unite#filters#lua_fuzzy_matcher(
        \ [{'word' : 'app/code/local/Tbuy/Utils/Block/LocalCurrency.php'}],
        \ { 'input' : 'apcoltbuyutilsblockl' }, 1),
        \ [{'word' : 'app/code/local/Tbuy/Utils/Block/LocalCurrency.php'}])

  call s:assert.equals(unite#filters#matcher_fuzzy#get_fuzzy_input(
        \  'fooooooooooooooooooooooooooooooooo'),
        \ ['fooooooooooooooooooooooooooooooooo', ''])
  call s:assert.equals(unite#filters#matcher_fuzzy#get_fuzzy_input(
        \  'fooooooooooooooooooooo/oooooooooooo'),
        \ ['fooooooooooooooooooooo', '/oooooooooooo'])

  call s:assert.equals(unite#helper#paths2candidates(
        \  ['foo']), [
        \ {'word' : 'foo', 'action__path' : 'foo'}])

  call s:assert.equals(unite#filters#converter_relative_word#lua([
        \  {'word' : '/foo/foo'},
        \  {'word' :
        \   unite#util#substitute_path_separator(expand('~/')).'bar'},
        \  {'word' : '/foo/foo', 'action__path' : '/foo/baz'},
        \ ], '/foo'), [
        \ {'word' : 'foo'}, {'word' : 'bar'},
        \ {'word' : 'baz', 'action__path' : '/foo/baz'}
        \ ])
endfunction

" vim:foldmethod=marker:fen:
