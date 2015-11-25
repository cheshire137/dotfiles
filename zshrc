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
  docker ps -a -a --filter="state=exited" | xargs docker rm
  docker images -q --filter="dangling=true" | xargs docker rmi
}

#/usr/bin/login -f sarah

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="moneypenny"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"

plugins=(git brew gem github osx vagrant jgrowl npm aws bower bundler cap)

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

export JAVA_HOME=`/usr/libexec/java_home`
export EC2_HOME="/Users/sarah/Documents/ec2-api-tools-1.6.12.2"
export PYTHONPATH="/usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:$PYTHONPATH"
export CR_APP_NAME=civchoice
export ERL_LIBS=$HOME/local/erlang
export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.3
export M2=$M2_HOME/bin
export PATH="/Users/sarah/bin:/usr/local/bin:/usr/local/sbin:$M2:$EC2_HOME/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias chase_git='git config user.name "Chase Southard"; git config user.email "chase.southard@gmail.com"'
alias sarah_git='git config user.name "Sarah Vessels"; git config user.email "cheshire137@gmail.com"'
alias reset_docker="docker-compose kill; docker-compose rm --force"
alias dcr="docker-compose run --rm"
alias dcreboot="docker-compose stop && docker-compose rm -f && if [ -f dev-in-docker.sh ]; then ./dev-in-docker.sh; fi"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

eval $(ssh-agent)
ssh-add ~/.ssh/cirrus_mio_rsa

eval "$(docker-machine env default --shell=bash)"

# git://github.com/zsh-users/zsh-syntax-highlighting.git
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fortune | cowsay | lolcat
