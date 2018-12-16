export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PATH="$HOME/.embulk/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"
alias ctags="`brew --prefix`/bin/ctags"

PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
