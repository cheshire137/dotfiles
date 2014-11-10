function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

#/usr/bin/login -f sarah

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="moneypenny"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"

plugins=(git brew gem github osx vagrant jgrowl depot_tools npm aws bower bundler cap)

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

export JAVA_HOME=`/usr/libexec/java_home`
export EC2_HOME="/Users/sarah/Documents/ec2-api-tools-1.6.12.2"
export PATH="/Users/sarah/bin:/usr/local/bin:/usr/local/sbin:$EC2_HOME/bin:$PATH"
export PYTHONPATH="/usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:$PYTHONPATH"
export CR_APP_NAME=civchoice
export ERL_LIBS=$HOME/local/erlang
export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.3

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias fs='foreman start'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

eval $(ssh-agent)
ssh-add ~/.ssh/cirrus_mio_rsa

# git://github.com/zsh-users/zsh-syntax-highlighting.git
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
