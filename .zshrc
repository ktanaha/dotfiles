#シェルスクリプトとして実行した場合は読み込まれない

export LANG=ja_JP.UTF-8

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

CASE_SENSITIVE="true"

function zman() {
  PAGER="less -g -s '+/^ {7}"$1"'" man zshall
}

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:$PATH
eval "$(rbenv init - zsh)"

# original config
setopt SHARE_HISTORY
setopt AUTO_CD
setopt AUTO_PUSHD

# <C-w>を単語区切りにする
autoload -Uz select-word-style
select-word-style default
zstyle ':zle*' word-chars " /=;@:(){},|"
zstyle ':zle*' word-style unspecified

# プロンプトの表示を変更する
PROMPT="[%n] %# "
RPROMPT="%F{yellow}[%~@%*] %F{green}%v"

# 設定を無効にする
setopt IGNORE_EOF
setopt NO_FLOW_CONTROL
setopt NO_BEEP

# Homebrewでインストールしたzsh-completionsを使えるようにする
fpath=(/usr/local/share/zsh_completions(N-/) ${fpath})

# 補完機能
autoload -Uz compinit
compinit

# 補完機能のメニュー選択モード
zstyle ':completion:*:default' menu select=2

# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt EXTENDED_HISTORY
setopt hist_no_store
setopt hist_expand
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^n' history-beginning-search-forward-end
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# emacs keybind
bindkey -e

# 便利なエイリアス達
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# URLやHTMLをブラウザで開く
autoload -Uz pick-web-browser
alias -s html=pick-web-browser
zstyle ':mime:*' x-browsers running chrome
zstyle ':mime:*' browser-style running chrome

# chrを使えるようにする
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

# 補完機能強化
zstyle ':chpwd:*' recent-dirs-max 200
zstyle ':chpwd:*' recent-dirs-default true

# 複数のファイルを一括でリネームする
# zmv -W 'before' 'after'
autoload -Uz zmv
alias zmv='noglob zmv -W'

# vcs_infoの設定
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]="$vcs_info_msg_0_"
}

add-zsh-hook precmd _update_vcs_info_msg

# antigen
if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
  source $HOME/.zsh/antigen/antigen.zsh
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen apply
fi

# peco関連
# コマンド履歴から実行する
function peco-execute-history() {
  local item
  item=$(builtin history -n -r 1 | peco --query="$LBUFFER")

  if [[ -z "$item" ]]; then
    return 1
  fi

  BUFFER="$item"
  CURSOR=$#BUFFER
  zle accept-line
}
zle -N peco-execute-history
bindkey '^x^r' peco-execute-history

# 最近移動したディレクトリに移動する
function peco-cdr() {
  local item
  item=$(cdr -l | sed 's/^[^ ]\{1,\} \{1,\}//' | peco)

  if [[ -z "$item" ]]; then
    return 1
  fi

  BUFFER="cd -- $item"
  CURSOR=$#BUFFER
  zle accept-line
}

zle -N peco-cdr
bindkey  '^xb' peco-cdr

# anyframe
antigen bundle mollifier/anyframe

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# vi vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim'
alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim"'
alias mvim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim'

# 新規で開くときにタブで開く
alias mvi="mvim -p --remote-tab-silent" 

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Android SDK
export ANDOIRD_HOME=/usr/local/opt/android-sdu

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/moutoku1984/.sdkman"
[[ -s "/Users/moutoku1984/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/moutoku1984/.sdkman/bin/sdkman-init.sh"

<<<<<<< HEAD
=======
# python
>>>>>>> ff5a7c21bb604961d61c0cd9acccc67106b8c151
PYENV_ROOT=~/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

<<<<<<< HEAD
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* }
=======
#rbenvをインストールしたときに設定したもの
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# AWS CLi
export PATH=~/.local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
>>>>>>> ff5a7c21bb604961d61c0cd9acccc67106b8c151
