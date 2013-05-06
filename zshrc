ZSH=$HOME/.oh-my-zsh
ZSH_THEME="moneypenny"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"

plugins=(git brew gem svn jgrowl)

export PATH="/Users/sarah/bin:/usr/local/bin:$PATH"
export CR_APP_NAME=civchoice

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias fs=foreman start -f Procfile.puma
