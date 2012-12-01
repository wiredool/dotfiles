" File: .vimrc
" Maintainerr: wiredool
" Last Change: 01-Dec-2012.
" win 32/64 kaoriya gvim without _(g)vimrc
" linux 32/64 distory-package 7.2 or bulid

" Environmental {{{
" let $LANG = 'ja_JP'
" let $LANG = 'en_US'
"
" chek for reload
if $UTILSPATH == ''
  let SEP = has('win32') || has('win64') ? ';' : ':'

  let $MYBUNDLE = expand('~/.vim/bundle')

  " for windows
  let $UTILSPATH .= $HOME . '/.vim/opt/' . SEP
  let $UTILSPATH .= $HOME . '/.vim/opt/curl' . SEP " XXX
  let $UTILSPATH .= $HOME . '/local/lib/curl-7.25.0-ssh2-ssl-sspi-zlib-static-bin-w32' . SEP
  let $UTILSPATH .= $HOME . '/local/lib/ImageMagick-6.7.9-0' . SEP
  let $PATH = expand($UTILSPATH) . $PATH
endif

" /Environmental }}}

" Encoding {{{
" utf-8 > cp932
set fileencodings=ucs-bom,utf-8,cp932,euc-jp
if &encoding !=? 'utf-8'
\  || has('win32')
\  || has('win64')
  let &termencoding = &encoding
  set encoding=utf-8
  let &runtimepath=iconv(&runtimepath, &termencoding, 'utf-8') " fix japanese path
endif
" after set encoding
scriptencoding utf-8
" /Encoding }}}

" Options {{{
" disable ime at start
set iminsert=0 imsearch=0
" deletable indent, end of line, pre text
set backspace=indent,eol,start
" save history count
set history=512
" for virtcal select
set virtualedit=block
" show match bracket
set showmatch
" tag is lower-case
set tags=./tags,tags
" swap-file create to one directory
" name is %path%to%file.swp
set directory^=$HOME/.vim/swap//
" call s:mkdir('$HOME/.vim/swap')
" nam format
set nrformats=hex

" tab
" display tab level width
set tabstop=4
" indent-command space size
set shiftwidth=2
" tabkey insert tab/spase size
set softtabstop=2
" tabkey insert space only
set expandtab

" display
" show special chars
set list listchars=tab:^\ ,trail:_,extends:>,precedes:<
" disable wrap
set nowrap
" show more text of arond cursor
set scrolloff=2
set sidescroll=8 sidescrolloff=8
" show folding level
set foldcolumn=2 foldmethod=marker
" always show statusline
set laststatus=2
" ex commandline height
set cmdheight=2
" show visual selection info
set showcmd
" show line info
set ruler
" set statusline=%!MyStatusLine()
" cursorline highlight
" set cursorline
" complete
set wildmenu
" search
" case-sensitive if included upper-case
set ignorecase smartcase
" inclimental search
set incsearch
" disable wrap saerch
set nowrapscan

" gui
" enable gui window title
set title
" disable gui menu/toolbar
set guioptions+=M
set guioptions-=m
set guioptions-=T
" disable scrollbar
set guioptions-=r
set guioptions-=L
" copy selection only modal
set guioptions+=A
" /Options }}}

" Autocmd reset {{{
augroup myrc
  autocmd!
augroup END
" /Autocmd reset }}}

" Bundle {{{
" reset did_load_filetypes for enable plugin's ftdetect
filetype off
if has('vim_starting')
  let g:neobundle#log_filename = $HOME . "/.vim/.neobundle.log"
  let g:neobundle#types#git#default_protocol = 'git' " 'git', 'https' or 'git+https'. 'git+https' is clone only.
  "let g:neobundle#types#hg#default_protocol = 'git'
  "let g:neobundle_default_git_protocol = 'git' " old name
  "let g:neobundle#default_options = { " not work, 'git not installed'
  "\     '_': { 'type': 'hg'}
  "\}
  set runtimepath+=$MYBUNDLE/neobundle.vim
  call neobundle#rc($MYBUNDLE)
endif

" management self
NeoBundle 'Shougo/neobundle.vim', {'type': 'hg', 'stay_some': 1}  " plugin manager
"NeoBundle 'wiredool/neobundle.vim', {'type': 'hg'} " plugin manager

" util
NeoBundle 'tyru/restart.vim', {'type': 'hg'} " exit and start vim, gui only
NeoBundle 'thinca/vim-quickrun', {'type': 'hg'} " run script
NeoBundle 'vim-jp/vital.vim', {'type': 'hg'}  " vim script utils
NeoBundle 'Shougo/vimproc', {'type': 'hg', 'stay_some': 1} " multi process
NeoBundle 'Shougo/vimshell', {'type': 'hg'} " shell
" NeoBundle 'Shougo/vimfiler', {'type': 'hg'} " filer
NeoBundle 'Shougo/unite.vim', {'type': 'hg'} " selecter
NeoBundle 'h1mesuke/unite-outline', {'type': 'hg'} " outline
NeoBundle 'kien/ctrlp.vim', {'type': 'hg'} " selecter
NeoBundle 'osyo-manga/shabadou.vim', {'type': 'hg'} " syntax check
NeoBundle 'osyo-manga/unite-quickfix', {'type': 'hg'}
NeoBundle 'osyo-manga/vim-watchdogs', {'type': 'hg'} " syntax check
NeoBundle 'kana/vim-fakeclip', {'type': 'hg'} " clip bord
NeoBundle 'kana/vim-altr', {'type': 'hg'}
NeoBundle 'mattn/ctrlp-launcher', {'type': 'hg'}

" user's textobject
NeoBundle 'kana/vim-textobj-user', {'type': 'hg'} " obuject util
NeoBundle 'kana/vim-gf-user', {'type': 'hg'} " jump

" web
NeoBundle 'mattn/webapi-vim', {'type': 'hg'} " web utils
NeoBundle 'mattn/wwwrenderer-vim', {'type': 'hg'} " show webpage
NeoBundle 'thinca/vim-ref', {'type': 'hg'} " show document
"NeoBundle 'basyura/TweetVim', {'type': 'hg'} " twitter client
"NeoBundle 'basyura/twibill.vim', {'type': 'hg'} " twitter api wapper, edit: without python
NeoBundle 'tyru/open-browser.vim', {'type': 'hg'} " open webbrowser
"NeoBundle 'tsukkee/lingr-vim', {'type': 'hg'} " lingr client, python

" imput
NeoBundle 'tyru/eskk.vim', {'type': 'hg'} " Japanese imput method
NeoBundle 'tyru/caw.vim', {'type': 'hg'} " comment
NeoBundle 'Shougo/neocomplcache', {'type': 'hg'} " complite
NeoBundle 'Shougo/neosnippet',    {'type': 'hg'}
" NeoBundle 'kana/vim-smartchr', {'type': 'hg'} " replace input char

" for langage
"NeoBundleLazy 'ujihisa/vim-scala', {'type': 'hg'} " support scala
"NeoBundleLazy 'ujihisa/shadow.vim', {'type': 'hg'} "
NeoBundle 'mattn/zencoding-vim', {'type': 'hg'} " support html/css
"NeoBundle 'othree/html5.vim' " html/css/js syntax
"NeoBundle 'hail2u/vim-css3-syntax', {'type': 'hg'} " css3 syntax
NeoBundle 'teramako/jscomplete-vim', {'type': 'hg'} " support javascript
"NeoBundle 'jsx/JSX', {'type': 'hg'} " support javascript
"NeoBundleLazy 'mattn/vdbi-vim', {'type': 'hg'}  " support sql (use parl)
"NeoBundleLazy 'Shougo/vinarise', {'type': 'hg'} " binary editer (use python)
"NeoBundle 'koron/java-helper-vim', {'type': 'hg'} " java omni-founcion
set runtimepath+=$GOROOT/misc/vim

" presentation
NeoBundle 'h1mesuke/vim-alignta', {'type': 'hg'} " multibyte align
NeoBundle 'thinca/vim-prettyprint', {'type': 'hg'} " printlnEx
NeoBundleLazy 'thinca/vim-fontzoom', {'type': 'hg'} " resize font
NeoBundleLazy 'thinca/vim-showtime', {'type': 'hg'} " it's showtime
NeoBundle 't9md/vim-quickhl', {'type': 'hg'} " hi
" NeoBundle 'nathanaelkane/vim-indent-guides', {'type': 'hg'} " show indent
" NeoBundle 'LeafCage/foldCC', {'type': 'hg'} " folding

" color scehme
NeoBundle 'vim-scripts/Zenburn', {'type': 'hg'}
NeoBundleLazy 'altercation/vim-colors-solarized', {'type': 'hg'}

" Vim script test framework
"NeoBundleLazy 'kana/vim-vspec', {'type': 'hg'} " test
"NeoBundleLazy 'tyru/simpletap.vim', {'type': 'hg'} " test
"NeoBundleLazy 'Shougo/vesting', {'type': 'hg'} " test
"NeoBundleLazy 'kannokanno/vimtest', {'type': 'hg'} " test

" sample code
NeoBundleLazy 'mattn/hahhah-vim', {'type': 'hg'}
NeoBundleLazy 'mattn/unite-macdonalds-vim', {'type': 'hg'}
NeoBundleLazy 'mattn/ctrlp-macdonald', {'type': 'hg'}
NeoBundleLazy 'osyo-manga/unite-moo', {'type': 'hg'}
NeoBundleLazy 'osyo-manga/unite-sl', {'type': 'hg'}
NeoBundleLazy 'osyo-manga/unite-u-nya-', {'type': 'hg'}
NeoBundleLazy 'osyo-manga/vim-homo-statusline', {'type': 'hg'}
NeoBundleLazy 'koron/homoo-vim', {'type': 'hg'}
NeoBundleLazy 'koron/u-nya-vim', {'type': 'hg'}
NeoBundleLazy 'koron/nyancat-vim', {'type': 'hg'}
NeoBundleLazy 'tyru/banban.vim', {'type': 'hg'}

" vimrc status
NeoBundleLazy 'mattn/benchvimrc-vim', {'type': 'hg'} " benchmark vimrc
NeoBundleLazy 'thinca/vim-scouter', {'type': 'hg'} " show vim power

" TokyoVim user's result.
NeoBundle 'thinca/vim-scall', {'type': 'hg'} " Calls a script local function readily.
NeoBundle 'daisuzu/rainbowcyclone.vim', {'type': 'hg'} " sarch word highlight
" :RC?Neo
" :RC?Bundle
" :RC/List
"
" :RCList
" :RC

" enable ftdetect, plugin and indent.
filetype plugin indent on
" /Bundle }}}

" Plugin settings {{{

" eskk.vim {{{
let g:eskk#large_dictionary = {
\	'path': expand('$HOME') . '/.vim/opt_file/SKK-JISYO.UTF-8.L',
\	'sorted': 1,
\	'encoding': 'utf-8'
\}

autocmd myrc User eskk-initialize-pre call s:eskk_initial_pre()
function! s:eskk_initial_pre()
  let t = eskk#table#new('rom_to_hira*', 'rom_to_hira')
  " zenkaku
  call t.add_map('z ', '　')
  " Input hankaku characters.
  call t.add_map('h-', '-')
  call t.add_map('h!', '!')
  call t.add_map('h/', '/')
  call t.add_map('h ', ' ')
  call t.add_map('h:', ':')
  call t.add_map('h;', ';')
  call t.add_map('h[', '[')
  call t.add_map('h]', ']')
  call t.add_map('(', '(')
  call t.add_map(')', ')')
  call eskk#register_mode_table('hira', t)
endfunction
" }}}

" vim-ref {{{
autocmd FileType ref call s:my_ref_initialize()
function! s:my_ref_initialize()
  nnoremap <buffer> q <C-w>c
endfunction
" webdict
let g:ref_source_webdict_sites = {
\	'wikipedhia': {
\		'url': 'http://ja.wikipedia.org/wiki/%s',
\		'keyword_encoding': 'utf-8',
\		'cache': 0,
\	}
\}

let g:ref_phpmanual_path = expand('$HOME') . '\local\share\php_manual_ja\php-chunked-xhtml'

" }}}

" zen-coding {{{
" from mattn's blog (http://mattn.kaoriya.net/software/vim/20120613184721.htm)
let g:user_zen_settings ={
\  'lang': 'ja',
\  'indentation': '  ',
\  'html' : {
\    'filters' : 'html',
\    'snippets' : {
\      'jq' : "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery.min.js\">\n</srcipt>\n<script>\n\\$(function() {\n\t|\n})()\n</script>",
\      'cd' : "<![CDATA[|]]>",
\    },
\  },
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'html,c',
\  },
\  'javascript' : {
\    'snippets' : {
\      'jq' : "\\$(function() {\n\t\\${cursor}\\${child}\n});",
\      'jq:json' : "\\$.getJSON(\"${cursor}\", function(data) {\n\t\\${child}\n});",
\      'jq:each' : "\\$.each(data, function(index, item) {\n\t\\${cursor}\\${child}\n});",
\      'fn' : "(function() {\n\t\\${cursor}\n}();",
\      'tm' : "setTimeout(function() {\n\t\\${cursor}\n}, 100);",
\    },
\  'use_pipe_for cursor' : 0,
\  },
\  'css' : {
\    'filters' : 'fc',
\    'snippets' : {
\      'box-shadow' : "-webkit-box-shadow: 0 0 0 # 000;\n-moz-box-shadow: 0 0 0 0 # 000;\nbox-shadow: 0 0 0 # 000;",
\    },
\  },
\  'less' : {
\    'filters' : 'fc',
\    'extends' : 'css',
\  },
\}
let g:use_zen_complete_tag = 1
" }}}

" kaoriya {{{
for path in split(glob($VIM.'/plugins/*'), '\n')
  if isdirectory(path) | let &runtimepath = &runtimepath.','.path | end
endfor
" }}}

" altr-vim {{{
call altr#define(
\ 'plugin/%.vim',
\ 'autoload/%.vim',
\ 'doc/%.jax',
\ 'doc/%.txt'
\)
" TODO; define rule
" }}}

" /Plugins }}}

" Settings {{{
autocmd myrc FileType help setlocal foldcolumn=1 sidescrolloff=0
" /Settings }}}

" Command {{{

" change encode {{{
command! -bang -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
command! -bang -nargs=? Sjis edit<bang> ++enc=sjis <args>

" from thinca's vimrc https://gist.github.com/3666285
" make directory
function! s:mkdir(file, ...)
  let f = a:0 ? fnamemodify(a:file, a:1) : a:file
  if !isdirectory(f)
    call mkdir(f, 'p')
  endif
endfunction
augroup vimrc
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    let mes = '"%s" does not exist. Create? [y/N]'
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf(mes, a:dir)) =~? '^y\%[es]$')
      call s:mkdir(a:dir)
    endif
  endfunction
augroup END
" }}}

" my neobundle wrapper {{{
command! NeoBundool call s:neobundool()
function! s:neobundool()
endfunction
" }}}

" /Command }}}

" Keymap {{{
" q is quit
nnoremap q <Nop>
nnoremap Q q

" easy typing
nnoremap : ;
nnoremap ; :
inoremap jj <Esc>
nnoremap Y y$

" for help
autocmd myrc FileType help nnoremap <buffer> q <C-w>c
nnoremap <C-h> :<C-u>help<Space>

" search with move center(zz) and open fold(zv)
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" zen
"inoremap <C-e> <Nop>
let g:user_zen_expandabbr_key = '<C-e>'
" paste from clipbord
inoremap <C-r>* <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>
" omni completion
inoremap <C-Space> <C-x><C-o>

nmap \p <Plug>(altr-back)
nmap \n <Plug>(altr-forward)

cnoremap <C-Space> <C-d>

" prefix
nnoremap <Space> <Nop>

" edit vimrc
nnoremap <Space>ee :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>eg :<C-u>edit $MYGVIMRC<CR>
" restart
nnoremap <Space>re :<C-u>Restart<CR>

" white space
nnoremap <Space>i i<Space><Esc>
nnoremap <Space>a a<Space><Esc>
nnoremap <Space>o o<Esc>
nnoremap <Space>O O<Esc>

" neobundle
nnoremap <Space>b :<C-u>edit $MYBUNDLE/<C-d>
nnoremap <Space>B :<C-u>NeoBundle<C-d>

" toggle
" text wrap
nnoremap <Space>w :<C-u>set wrap!<CR>
" saerch wrap
nnoremap <Space>W :<C-u>set wrapscan!<CR>
" line number
nnoremap <Space>n :<C-u>set number!<CR>
nnoremap <Space>N :<C-u>setlocal relativenumber!<CR>
" tab
nnoremap <Space>t :<C-u>setlocal expandtab!<CR>
" hilight
nmap <Space>h <Plug>(quickhl#toggle)

" /Map }}}

" Statusline {{{
function! MyStatusLine()
  let line =''
  return line
endfunction
" /Statusline }}}

" Color scehme {{{
augroup vimrc
  autocmd ColorScheme * call s:onColorScheme()
augroup END
function! s:onColorScheme()
  " in overwrite, '!' is required.
  " disable italic
  highlight! Comment gui=NONE
  " NonText eol, extends, recedes
  highlight! link NonText Error
  " SpecialKey nbsp, tab, trail
  "highlight! link SpecialKey Error
endfunction

set t_Co=256
syntax enable
set background=dark
colorscheme zenburn
" /Color scehme }}}

" Memo {{{
" option
" set foo=$BAR/baz                   " not space
" let &foo = expand('$BAR') . '/baz' " space ok
"
" statuslineitem
" %[-][0][minwid][.maxwid]{item}
" space '\ '
"
" hg
" :s@\(^\s*NeoBundle\%[Lazy]\s\+'[^']*'\)\s*\(.*$\)@\1, {'type': 'hg'} \2@g
" :s@\(^\s*NeoBundle\%[Lazy]\s\+'[^']*'\)\s*,\s*{\s*'type'\s*:\s*'hg'\s*}\s*\(.*$\)@\1 \2@g
" /Memo }}}

" PR {{{
" Vim Advent Calendar 2012
" http://atnd.org/events/33746

" Vimperator Advent Calendar 2012
" http://atnd.org/events/34070
" /PR }}}
"
" vim: foldmethod=marker
