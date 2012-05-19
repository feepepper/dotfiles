
set fileencoding=euc
set enc=japan
set ttyfast
set autoindent
set tabstop=4
set shiftwidth=4
set number
syntax on

set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimbackup
set ignorecase
set smartcase

autocmd FileType php let b:surround_45 = "<?php \r; ?>"
autocmd FileType php let b:surround_112 = "echo '<pre>'.print_r(\r, true).'</pre>';"
autocmd FileType ctp let b:surround_112 = "echo '<pre>'.print_r(\r, true).'</pre>';"
nmap <silent> <unique> <CR> :call BufferList()<CR>

augroup BinaryXXD
	au!
	au BufReadPre *.bin let &binary = 1
	au BufReadPost * if &binary | silent %!xxd -g 1
	au BufReadPost * set ft=xxd | endif
	au BufWritePre * if &binary | %!xxd -r | endif
	au BufWritePost * if &binary | silent %!xxd -g 1
	au BufWritePost * set nomod | endif
augroup END

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

filetype plugin indent on

" 入力モードで開始
let g:unite_enable_start_insert=1

"mru,reg,buf
noremap :um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
noremap :ur :<C-u>Unite register -buffer-name=register<CR>
noremap :ub :<C-u>Unite buffer -buffer-name=buffer<CR>

"file current_dir
noremap :ufc :<C-u>Unite file -buffer-name=file<CR>
noremap :ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>

"file file_current_dir
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
noremap :uffr :<C-u>UniteWithBufferDir file_rec -buffer-name=file_rec<CR>

" c-jはescとする
au FileType unite nnoremap <silent> <buffer> <c-j> <esc><CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"```vim
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'php' : $HOME . '/.vim/dict/php.dict',
    \ 'ctp' : $HOME . '/.vim/dict/php.dict',
    \ 'pl' : $HOME . '/.vim/dict/perl.dict',
    \ 'pm' : $HOME . '/.vim/dict/perl.dict',
    \ 'rb' : $HOME . '/.vim/dict/ruby.dict'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"```
