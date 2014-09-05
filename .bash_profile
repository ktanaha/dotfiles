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
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
