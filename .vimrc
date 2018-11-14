" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplete'
NeoBundle 'tpope/vim-rails'
NeoBundle 'mshibuya/vim-ruby'
NeoBundle 'git-commit'
NeoBundle 'cucumber.zip'
NeoBundle 'ref.vim'
NeoBundle 'haml.zip'
NeoBundle 'jade.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'unite.vim'
NeoBundle 'sudo.vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'muz/vim-gemfile'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'leafgarland/typescript-vim'
" vim-scripts repos
" NeoBundle 'rails.vim'
" non github repos
" NeoBundle 'git://git.wincent.com/command-t.git'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"  Global Configuration
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set t_Co=256
set background=dark
set backspace=2
syntax on
colorscheme desert

"  Ruby Settings
au BufNewFile,BufRead *.rb set fenc=utf-8
au BufNewFile,BufRead *.html.erb set fenc=utf-8

"  PHP Settings
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set tabstop=2
autocmd FileType php set shiftwidth=2
autocmd FileType php set softtabstop=2


"  Javascript Settings
autocmd FileType javascript set tabstop=2
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set softtabstop=2


"  HTML and CSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" neocomplete settings
" http://vim-users.jp/2010/10/hack177/
" http://vim-users.jp/2010/11/hack185/
" http://vim-users.jp/2011/01/hack193/

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#min_syntax_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplete#snippets_expand)
smap <C-k>     <Plug>(neocomplete#snippets_expand)
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplete#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#omni_patterns')
    let g:neocomplete#omni_patterns = {}
endif
let g:neocomplete#omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

let g:neocomplete#force_overwrite_completefunc = 1
