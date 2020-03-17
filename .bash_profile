eval "$(rbenv init -)"
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH="$HOME/.rbenv/bin:$PATH"
alias puma="ps aux |grep 'puma' | grep -v grep  | awk '{ print \"kill -9\", \$2 }' | sh"
alias ci=“bundle exec rubocop -a && bundle exec slim-lint app/**/*.slim && bundle exec rspec spec/”
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
