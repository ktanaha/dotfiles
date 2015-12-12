alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias mvi="mvim -p --remote-tab-silent"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Android SDK
export ANDOIRD_HOME=/usr/local/opt/android-sdu

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/moutoku1984/.sdkman"
[[ -s "/Users/moutoku1984/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/moutoku1984/.sdkman/bin/sdkman-init.sh"
