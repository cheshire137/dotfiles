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

#/usr/bin/login -f sarah

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="moneypenny"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"

# git://github.com/zsh-users/zsh-syntax-highlighting.git
plugins=(git brew gem github osx jgrowl npm bundler zsh-syntax-highlighting)

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

export GOPATH="$HOME/code/go/"
export JAVA_HOME=`/usr/libexec/java_home`
export PATH="/Users/cheshire137/bin:$GOPATH/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias shay_git='git config user.name "Shay Frendt"; git config user.email "shay.frendt@gmail.com"'
alias sarah_git='git config user.name "Sarah Vessels"; git config user.email "cheshire137@gmail.com"'

alias rdm='bin/rake db:migrate db:test:prepare'

alias dcemptytrash='docker rm $(docker ps -q -f status=exited)'
alias reset_docker="docker-compose kill; docker-compose rm --force"
alias dcr="docker-compose run --rm"
alias dcreboot="docker-compose stop && docker-compose rm -f && if [ -f dev-in-docker.sh ]; then ./dev-in-docker.sh; fi"

# eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa

eval "$(nodenv init -)"

#eval "$(docker-machine env default --shell=bash)"

fortune | cowsay | lolcat

# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
[[ -f /usr/local/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh ]] && . /usr/local/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh
# added by travis gem
[ -f /Users/cheshire137/.travis/travis.sh ] && source /Users/cheshire137/.travis/travis.sh
