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

<<<<<<< HEAD
alias mvi="mvim --remote-tab-silent"

# Java
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.8.0
=======
# Java
export PATH="/usr/bin:$PATH"
export JAVA_HOME="/usr/bin/"

### maven
export PATH="/Users/user/Develop/java/spring-boot/apache-maven-3.2.3/bin:$PATH"
>>>>>>> refs/remotes/origin/master
