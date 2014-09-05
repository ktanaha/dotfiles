"--------------------
"" 基本的な設定
"--------------------
"Vimの機能をフルに発揮できるようにvi互換をオフする
set nocompatible
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

"新しい行のインデントを現在行と同じにする
set autoindent 
 
"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup
 
"クリップボードをWindowsと連携する
set clipboard=unnamed
  
"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup

"長い文章を切り返さない
set nowrap

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
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

filetype plugin indent on     " required!
filetype indent on

"-------------------------------------------------------

" originalrepos on github
"NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/unite.vim'
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

