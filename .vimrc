set encoding=utf-8
scriptencoding utf-8

"履歴の数
set history=200
"バックスペースで文字を削除する
set backspace=start,eol,indent
"カーソル移動でも行をまたぐようにする
set whichwrap=b,s,[,],<,>,~
"Syntaxを有効にする
syntax on
"検索時にはハイライトが有効にならないようにしておく
set nohlsearch
"ステータスラインを２行表示する
set laststatus=3
"フルパスで表示するよう
set statusline=%F%r%h%=
"行番号を表示する
set number
"インクリメンタルサーチを行う
set incsearch
"インクリメンタルサーチで大文字小文字を区別しない
set ignorecase
"コマンドラインモードの補完表示
set wildmenu wildmode=list:full
"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup
" 不可視文字を表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" インデントをshiftwidthの倍数に丸める
set shiftround
" 補完の際の大文字小文字の区別しない
set infercase
" クリップボードをWindowsと連携する
set clipboard=unnamed
"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup
"長い文章を切り返さない
set nowrap
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示する
set showmatch
"タブの代わりに空白文字を指定する
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set smarttab
set hidden

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

"検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

"/を自動的にエスケープする
cnoremap <expr> / getcmdtype() = '/' ? '\/' : '/'

"jvgrepを有効にする
if executable('jvgrep')
  set grepprg=jvrep
endif

filetype off

"-------------------------------------------------------
"NeoBundleの設定
"-------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

filetype plugin indent on

"プラグインがインストールされているかどうかを確認する
NeoBundleCheck

".vimrcを読み込み直した場合の設定
if !has('vim_staartinng')
  call neobundle#call_hook('on_source')
endif

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
\ 'build': {
\ 'windows': 'make -f make_mingw32.mak',
\ 'cygwin': 'make -f make_cygwin.mak',
\ 'mac': 'make -f make_mac.mak',
\ 'unix': 'make -f make_unix.mak',
\ }
\}
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'grep.vim'

call neobundle#end()

"ヘルプの日本語化
set helplang=jp,en
