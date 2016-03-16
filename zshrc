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

#/usr/bin/login -f sarah

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="moneypenny"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"

# git://github.com/zsh-users/zsh-syntax-highlighting.git
plugins=(git brew gem github osx vagrant jgrowl npm aws bower bundler cap zsh-syntax-highlighting)

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

export JAVA_HOME=`/usr/libexec/java_home`
export PATH="bin:~/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:$PATH"

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias reset_docker="docker-compose kill; docker-compose rm --force"
alias dcr="docker-compose run --rm"
alias dcreboot="docker-compose stop && docker-compose rm -f && if [ -f dev-in-docker.sh ]; then ./dev-in-docker.sh; fi"

eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa

#eval "$(docker-machine env default --shell=bash)"

fortune | cowsay | lolcat
