# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
eval "$(rbenv init - zsh)"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
PROMPT="[%n@%m](%*%) %~ %# "

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
HISTSIZE=1000000
SAVEHIST=1000000

# コマンド履歴のインクリメンタル検索
bindkey '^r' \
  history-incremental-pattern-search-backward
bindkey '^s' \
  history-incremental-pattern-search-forward
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end \
  history-search-end
bindkey "^o" history-beginning-search-backward-end

# vi keybind
bindkey -v

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
RPROMPT="%v"

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
