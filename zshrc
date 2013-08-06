ZSH=$HOME/.oh-my-zsh
ZSH_THEME="moneypenny"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"

plugins=(git brew gem svn jgrowl)

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

export PATH="/Users/sarah/bin:/usr/local/bin:/usr/local/share/python:$PATH"
export PYTHONPATH="/usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:$PYTHONPATH"
export CR_APP_NAME=civchoice

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias fs='foreman start -f Procfile.puma'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
