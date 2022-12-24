function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# get the name of the branch we are on
function rvm_prompt_info() {
  ruby_version=$(~/.rvm/bin/rvm-prompt i v 2> /dev/null) || return
  if [ -n "$ruby_version" ]; then
    echo "$ZSH_THEME_RVM_PROMPT_PREFIX$ruby_version$ZSH_THEME_RVM_PROMPT_SUFFIX"
  fi
}

function git_user_initials {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_USER_PROMPT_PREFIX$(git config --get user.name | sed 's/[a-z]//g' | sed -e 's/[ \t][ \t]*//g')$ZSH_THEME_GIT_USER_PROMPT_SUFFIX"
}

function dockerclean {
  docker ps -a --filter="state=exited" | xargs docker rm
  docker images -q --filter="dangling=true" | xargs docker rmi
}

# thanks @probablycorey -- https://gist.github.com/probablycorey/f8dac19d3757da4579f03fc7f6327377
function woman() {
  man -t $1 | open -f -a /Applications/Preview.app
}

# thanks @d12
function notify {
  title=${1:-"🎉   Finished! 🎉  "}
  msg=${2:-"Your command is finished!"}
  osascript -e "display notification \"$msg\" with title \"$title\" sound name \"Default\""
}

#/usr/bin/login -f sarah

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="moneypenny"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"

# git://github.com/zsh-users/zsh-syntax-highlighting.git
# zstyle :omz:plugins:ssh-agent agent-forwarding on
# zstyle :omz:plugins:ssh-agent identities id_rsa
# plugins=(git brew gem github osx jgrowl npm bundler ssh-agent zsh-syntax-highlighting)
plugins=(git brew github osx jgrowl npm zsh-syntax-highlighting)

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

export EDITOR="/Users/cheshire137/bin/code-wait.sh"
export VISUAL="$EDITOR"
export GOPATH="$HOME/code/go/"
export JAVA_HOME=`/usr/libexec/java_home`
export PATH="/usr/local/go/bin:/usr/local/opt/krb5/bin:/usr/local/opt/mysql@5.7/bin:$HOME/bin:$HOME/.cargo/bin:$GOPATH/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/python/libexec/bin:/usr/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias git='/usr/local/bin/git'
alias gco='git checkout'
alias rdm='bin/rake db:migrate db:test:prepare'
alias gitt='git'
alias ctags="`brew --prefix`/bin/ctags"

# Add git count-lines alias from https://stackoverflow.com/a/7010890
git config --global alias.count-lines "! git log --author=\"\$1\" --pretty=tformat: --numstat | awk '{ add += \$1; subs += \$2; loc += \$1 - \$2 } END { printf \"added lines: %s, removed lines: %s, total lines: %s\n\", add, subs, loc }' #"

alias dcemptytrash='docker rm $(docker ps -q -f status=exited)'
alias reset_docker="docker-compose kill; docker-compose rm --force"
alias dcr="docker-compose run --rm"
alias dcreboot="docker-compose stop && docker-compose rm -f && if [ -f dev-in-docker.sh ]; then ./dev-in-docker.sh; fi"

# Don't need these with ~/.ssh/config modifications
# See https://apple.stackexchange.com/a/264974
#eval $(ssh-agent)
#ssh-add ~/.ssh/id_rsa

# eval "$(nodenv init -)"

#eval "$(docker-machine env default --shell=bash)"

fortune | cowsay

# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
[[ -f /usr/local/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh ]] && . /usr/local/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh
# added by travis gem
[ -f /Users/cheshire137/.travis/travis.sh ] && source /Users/cheshire137/.travis/travis.sh
