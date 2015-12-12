# シェルスクリプトとして実行されたときにも読み込まれる

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# 新規で開くときにタブで開く
alias mvi="mvim -p --remote-tab-silent" 

# export rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

### Added by the Heroku Toolbelt                                    
export PATH="/usr/local/heroku/bin:$PATH"

### Android SDK
export ANDOIRD_HOME=/usr/local/opt/android-sdu

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
