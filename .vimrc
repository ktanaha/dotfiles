"--------------------
"" 基本的な設定
"--------------------
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
set laststatus=2
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
" 文字がない場所にもカーソルを移動できるようにする
set virtualedit=all
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
" 対応括弧の表示秒数を3秒にする
set matchtime=3
"タブの代わりに空白文字を指定する
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
  
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
    
"新しい行を作った時に高度な自動インデントを行う
"set smarttab
     
"grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
       
"検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

filetype off

"-------------------------------------------------------
"NeoBundleの設定
"-------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

"neoBundle.vim自身でneoBundle.vimを管理する
NeoBundleFetch 'Shougo/neobundle.vim'
  
call neobundle#end()

filetype plugin indent on

"プラグインがインストールされているかどうかを確認する
NeoBundleCheck

".vimrcを読み込み直した場合の設定
if !has('vim_staartinng')
  call neobundle#call_hook('on_source')
endif
"-------------------------------------------------------

"ヘルプを日本語表示する
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
\ 'build': {
\ 'windows': 'make -f make_mingw32.mak',
\ 'cygwin': 'make -f make_cygwin.mak',
\ 'mac': 'make -f make_mac.mak',
\ 'unix': 'make -f make_unix.mak',
\ }
\}
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
"コード入力補完
NeoBundle 'Shougo/neocomplcache'
"スニペット機能
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'thinca/vim-quickrun'
"HTML/CSS系
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tpope/vim-markdown'
"NERDTree
NeoBundle 'scrooloose/nerdtree'
"複数カーソル
NeoBundle 'terryma/vim-multiple-cursors'
"RAILS用
NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}

NeoBundle 'tpope/vim-endwise.git' " if...endなど対応するキーワードの自動補完
NeoBundle 'ruby-matchit'  " %を拡張して、def...end等のキーワードを移動出来るようにする。

NeoBundle 'Townk/vim-autoclose'
NeoBundle 'grep.vim'
NeoBundle 'drillbits/nyan-modoki.vim'


" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

"ヘルプの日本語化
set helplang=jp,en

"NERDTree用の設定
let file_name = expand("%:p")
if has('vim_starting') && file_name == ""
  autocmd VimEnter * call ExecuteNERDTree()
endif

let NERDTreeShowHidden = 1
autocmd VimEnter * execute 'NERDTree'

" カーソルが外れているときは自動的にnerdtreeを隠す
function! ExecuteNERDTree()
    "b:nerdstatus = 1 : NERDTree 表示中
    "b:nerdstatus = 2 : NERDTree 非表示中
 
    if !exists('g:nerdstatus')
        execute 'NERDTree ./'
        let g:windowWidth = winwidth(winnr())
        let g:nerdtreebuf = bufnr('')
        let g:nerdstatus = 1 
 
    elseif g:nerdstatus == 1 
        execute 'wincmd t'
        execute 'vertical resize' 0 
        execute 'wincmd p'
        let g:nerdstatus = 2 
    elseif g:nerdstatus == 2 
        execute 'wincmd t'
        execute 'vertical resize' g:windowWidth
        let g:nerdstatus = 1 
 
    endif
endfunction
noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>

"vimproc_mac.soのエラーがでるので追加
if has('mac')
  " let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/proc.so'
  let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
endif

" syntasticの設定
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['html'] }
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checker = 'jshint'

" この設定入れるとshiftwidthを1にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 2
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1

"---Quick Run---"
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
    \    'outputter': 'browser'
    \ }

