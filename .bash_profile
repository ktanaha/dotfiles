if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

export PATH=/Users/user/Develop/scala/bin/svm:$PATH

if [[ -d "${HOME}/.svm/current/rt" ]];
then
  export SCALA_HOME=${HOME}/.svm/current/rt
  export PATH=$SCALA_HOME/bin:$PATH
fi

PATH=/usr/local/bin:$PATH

#rbenvをインストールしたときに設定したもの
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/moutoku1984/.sdkman"
[[ -s "/Users/moutoku1984/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/moutoku1984/.sdkman/bin/sdkman-init.sh"
