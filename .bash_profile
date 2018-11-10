# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
PATH="/Users/philipkarlsson/dev/tools/:${PATH}"
export PATH
alias c='cd'
alias ..='cd ../'
alias n='nvim'
alias l='ls -lhaG'
alias t='tree -L 2 | less'
alias gcpp='rg -m 4 -tcpp'
alias ff='find . -type f -name'
alias fd='find . -type d -name'
alias p='pwd'

alias gs='git status'

export PATH="$HOME/.cargo/bin:$PATH"

# Start lldb session
alias dbg='export PATH=/usr/bin/:$PATH && lldb -s ~/dev/ReverseEngineering/tools/lldb/init.lldb'
alias od='objdump -no-show-raw-insn -D -color -x86-asm-syntax=intel'
set -o vi
bind '"jk":vi-movement-mode'
alias v="nvim"
alias dev="cd ~/dev"

export LANGUAGE='en_US.UTF-8 git'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Change prompt
# Show dirty state in prompt when in Git repos
export GIT_PS1_SHOWDIRTYSTATE=1
# Change prompt
PS1_OLD=${PS1}
export PS1='\[\033[1;34m\]\!\[\033[0m\] \[\033[1;35m\]\u\[\033[0m\]:\[\033[1;35m\]\W\[\033[0m\] \[\033[1;92m\]$(__git_ps1 "(%s)")\[\033[0m\]$ '
