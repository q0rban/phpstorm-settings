# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\[\033[1;32m\]\h\[\033[0;33m\] \w\[\033[1;32m\]$(parse_git_branch)\[\033[00m\]: '

alias la="ls -la"
alias free="free -m"
alias key="cat ~/.ssh/id_rsa.pub"

# Git Aliases
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'

# Mac git bash completion.
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Git bash completion on other platforms. You'll need to copy
# git-completion.bash in contrib to /etc/bash_completion.d/
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi


# If we have private declarations, include them.
if [ -f ~/.bash_private ]; then
  . ~/.bash_private
fi

export PATH
export PS1
