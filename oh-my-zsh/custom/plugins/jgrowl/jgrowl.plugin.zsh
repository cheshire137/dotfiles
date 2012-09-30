c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

a() { cd ~/code/active/$1; }
_a() { _files -W ~/code/active -/; }
compdef _a a

.d() { cd ~/.dotfiles/$1; }
_.d() { _files -W ~/.dotfiles -/; }
compdef _.d .d

export EDITOR='vim'

# autocorrect is more annoying than helpful
unsetopt correct_all

# a few aliases I like
alias gs='git status'
alias gd='git diff'
alias tlog='tail -f log/development.log'
alias ss='svn status'
alias si='svn info'
alias sci='svn ci'
alias sup='svn up'
alias sm='svn merge'
alias sshsu='ssh jonathan@spectr.us'
alias set-active='unlink ~/code/active &> /dev/null; ln -s $PWD ~/code/active'

#alias ff='find ~/ -type f -name '

# add plugin's bin directory to path
export PATH="$(dirname $0)/bin:$PATH"
