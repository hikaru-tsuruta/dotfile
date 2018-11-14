export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:$PATH:/usr/X11/bin:/usr/local/share/npm/bin:/Users/shibuya/Android/sdk/platform-tools:/Users/shibuya/Android/sdk/tools
export JAVA_HOME=$(/usr/libexec/java_home)
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC -Xmx3072M -Xss4M -XX:MaxMetaspaceSize=256M"

export V7_USER=hikaru=
export SSH_KEY_V7_USER=~/.ssh/id_ecdsa

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if which jenv > /dev/null; then eval "$(jenv init -)"; fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias ls='ls -G'
alias be='bundle exec'
alias pd='powder'
alias vi='vim'
