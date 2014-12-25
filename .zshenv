alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias mvi="mvim --remote-tab-silent"

# export rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

### Added by the Heroku Toolbelt                                    
export PATH="/usr/local/heroku/bin:$PATH"

### Android SDK
export ANDOIRD_HOME=/usr/local/opt/android-sdu

# Java
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.8.0
