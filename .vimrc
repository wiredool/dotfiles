" File: .vimrc
" Maintainerr: 
" Last Change: 14-Jul-2012.

" Encoding {{{
" use utf-8 encoding, priority utf-8 > cp932
" fileencoidings utf-8 is spesial, if equal encoding but check next
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,ucs-bom,eucjp-ms,utf-8,cp932
if &encoding !=? 'utf-8'
  let &termencoding = &encoding
  set encoding=utf-8
endif
" after set encoding
scriptencoding utf-8
" /encoding }}}

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
" tag is lower-case to avoid duplicate
set tags=./tags,tags
" swap-file create to one directory
" name is %path%to%file.swp
set directory^=$HOME/.vim/swap//
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
" ex line height
set cmdheight=2
" show visual selection info
set showcmd
" show line info
set ruler
" set statusline=%!MyStatusLine()
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
" /options }}}

" Autocmd reset {{{
augroup myrc
  autocmd!
augroup END
" /autocmd reset }}}

" Environmental {{{
" let $LANG = 'ja_JP'
" let $LANG = 'en_US'
if $UTILSPATH == ''
  let $UTILSPATH = expand('$HOME') . '\local\lib\curl-7.25.0-ssh2-ssl-sspi-zlib-static-bin-w32'
  " let $UTILSPATH .= expand('$HOME') . '
  let $PATH = $UTILSPATH . ';' . $PATH " XXX: win only
endif
if $MYBUNDLE == ''
  let $MYBUNDLE = expand('~/.vim/bundle')
endif
" /environmental }}}

" Bundle {{{
" disable ditect, plugin and indent for loading.
filetype off
filetype plugin indent off
if has('vim_starting')
  let g:neobundle_default_git_protocol = 'git+https'
  " let &runtimepath .= ',' . expand('$MYBUNDLE') . '/neobundle.vim'
  set runtimepath+=$MYBUNDLE/neobundle.vim
  call neobundle#rc(expand('$MYBUNDLE'))
endif

" management self
NeoBundle 'Shougo/neobundle.vim', {'type': 'hg'}  " plugin manager
" NeoBundle 'wiredool/neobundle.vim', {'type': 'hg'} " plugin manager

" util
NeoBundle 'tyru/restart.vim', {'type': 'hg'} " exit and start vim
NeoBundle 'thinca/vim-quickrun', {'type': 'hg'} " run script
NeoBundle 'mattn/webapi-vim', {'type': 'hg'} " web utils
" NeoBundle 'Shougo/vimproc', {'type': 'hg'} " multi process
" NeoBundle 'Shougo/vimshell', {'type': 'hg'} " shell
" NeoBundle 'Shougo/vimfiler', {'type': 'hg'} " filer
NeoBundle 'kien/ctrlp.vim', {'type': 'hg'} " selecter
NeoBundle 'Shougo/unite.vim', {'type': 'hg'} " selecter
NeoBundle 'h1mesuke/unite-outline', {'type': 'hg'} " outline
" NeoBundleLazy 'ujihisa/vital.vim', {'type': 'hg'}  " vim script utils
" NeoBundleLazy 'mattn/benchvimrc-vim' ,{'type' : 'hg'} " benchmark vimrc
" user's textobject
NeoBundle 'kana/vim-textobj-user', {'type': 'hg'} " obuject util
NeoBundle 'kana/vim-gf-user', {'type': 'hg'} " jump

" clipbord
" NeoBundle 'kana/vim-fakeclip', {'type': 'hg'} " clip bord
"
" Vim script test framework
" NeoBundleLazy 'kana/vim-vspec', {'type': 'hg'} " test
NeoBundle 'tyru/simpletap.vim', {'type': 'hg'} " test

" NeoBundle 'nathanaelkane/vim-indent-guides', {'type': 'hg'} " show indent
" NeoBundle 'LeafCage/foldCC', {'type': 'hg'} " folding
NeoBundle 'basyura/TweetVim', {'type': 'hg'} " twitter client
NeoBundle 'basyura/twibill.vim', {'type': 'hg'} " twitter api wapper, edit: without python
NeoBundle 'tyru/open-browser.vim', {'type': 'hg'} " open webbrowser
" NeoBundle 'tsukke/lingr-vim', {'type': 'hg'} " lingr client

" imput
NeoBundle 'tyru/eskk.vim', {'type': 'hg'} " Japanese imput method
NeoBundle 'tyru/caw.vim', {'type': 'hg'} " comment
NeoBundle 'Shougo/neocomplcache', {'type': 'hg'} " complite
NeoBundle 'kana/vim-smartchr', {'type': 'hg'} " replace input char

" for langage
" orignal 'derekwyatf/vim-scala'
NeoBundleLazy 'ujihisa/vim-scala', {'type': 'hg'} " support scala
" NeoBundleLazy 'ujihisa/shadow.vim', {'type': 'hg'} "
NeoBundle 'mattn/zencoding-vim', {'type': 'hg'} " support html/css
" NeoBundle 'othree/html5.vim' " html/css/js syntax
NeoBundle 'hail2u/vim-css3-syntax', {'type': 'hg'} " css3 syntax
NeoBundle 'teramako/jscomplete-vim', {'type': 'hg'} " support javascript
NeoBundle 'jsx/jsx', {'type': 'hg'} " support javascript
" NeoBundleLazy 'mattn/vdbi-vim', {'type': 'hg'}  " support sql (use parl)
" NeoBundleLazy 'Shougo/vinarise', {'type': 'hg'} " binary editer (use python)

" presentation
NeoBundle 'thinca/vim-ref', {'type': 'hg'} " show document
NeoBundle 'mattn/wwwrenderer-vim', {'type': 'hg'} " show webpage
NeoBundle 'h1mesuke/vim-alignta', {'type': 'hg'} " multibyte align
NeoBundleLazy 'thinca/vim-fontzoom', {'type': 'hg'} " resize font
" NeoBundleLazy 'thinca/vim-showtime', {'type': 'hg'} " is's showtime
" NeoBundleLazy 'thinca/vim-prettyprint', {'type': 'hg'} " printlnEx

" color scehme
NeoBundle 'Zenburn', {'type': 'hg'}
" NeoBundleLazy 'altercation/vim-colors-solarized', {'type': 'hg'}

" enable detect, plugin and indent.
filetype plugin indent on
" /bundle }}}

" Plugin settings {{{

" eskk.vim {{{
"
let g:eskk#large_dictionary = {
\	'path': expand('$HOME') . '/.eskk/dict/SKK-JISYO.L',
\	'sorted': 1,
\	'encoding': 'euc-jp'
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
\	},
\	'alc': {
\		'url': 'http://eow.alc.co.jp/search?q=%s',
\		'keyword_encoding': 'utf-8',
\		'cache': 0,
\	},
\}

let g:ref_phpmanual_path = expand('$HOME') . '\local\share\php_manual_ja\php-chunked-xhtml'

function! g:ref_source_webdict_sites.alc.filter(output)
  return "aaaaaaaaaaaaaaaaaa"
  "return join(split(a:output, "\n")[33 :], "\n")
endfunction
" }}}

" zen-coding {{{
let g:user_zen_settings ={
\  'lang': 'ja',
\  'indentation': '  ',
\  'html' : {
\    'filters' : 'html',
\    'snipets' : {
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

" /plugins }}}

" Settings {{{
autocmd myrc FileType help setlocal foldcolumn=1 sidescrolloff=0
" /settings }}}

" Statusline {{{
function! MyStatusLine()
  let line =''
  return line
endfunction
" /statusline }}}

" Keymap {{{
" q is quit
nnoremap q <Nop>
nnoremap Q q

" for help
autocmd myrc FileType help nnoremap <buffer> q <C-w>c
nnoremap <C-h> :<C-u>help<Space>

" easy to type
nnoremap : ;
nnoremap ; :
inoremap jj <Esc>
inoremap <expr> = smartchr#loop('=', ' = ', '==', '===')
cnoremap <expr> / smartchr#loop('/', '~/', '//', '///')
" edit vimrc
nnoremap <Space> <Nop>
nnoremap <Space>ee :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>eg :<C-u>edit $MYGVIMRC<CR>
" restart
nnoremap <Space>re :<C-u>:Restart<CR>
nnoremap <Space>re<Esc> <Nop>
" text worp
nnoremap <Space>w :<C-u>set wrap!<CR>
" saerch wrap
nnoremap <Space>W :<C-u>set wrapscan!<CR>
" number
nnoremap <Space>n :<C-u>set number!<CR>
nnoremap <Space>N :<C-u>set relativenumber!<CR>
" zen
"inoremap <C-e> <Nop>
let g:user_zen_expandabbr_key = '<C-e>'
" open dir (win only)
nnoremap <Space>ex :<C-u>!explorer.exe .<CR>
" /map }}}

" Color scehme {{{
" for 256color
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
syntax enable
set background=dark
colorscheme zenburn
" disable italic
highlight Comment gui=NONE
" for listchars
highlight link  NonText Error
highlight link  SpecialKey Error
" /color scehme }}}

" memo {{{
" option
" set foo=$BAR/baz                   " not space
" let &foo = expand('$BAR') . '/baz' " space ok, option use &
"
" statuslineitem
" %[-][0][minwid][.maxwid]{item}
" space '\ '
"
" hg
" :s@\(^\s*NeoBundle\s\+'[^']*'\)\s*\(.*$\)@\1, {'type': 'hg'} \2@g
" :s@\(^\s*NeoBundle\s\+'[^']*'\)\s*,\s*{\s*'type'\s*:\s*'hg'\s*}\s*\(.*$\)@\1 \2@g
" /memo }}}

" vim: foldmethod=marker

