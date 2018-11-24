#
# ~/.bashrc
set -o vi
bind '"jk":vi-movement-mode'
alias c="cd"
alias ..="cd .."
alias v="nvim"
alias l="ls -la"
alias s="sudo"
alias so="source"
alias gs="git status"
alias gc="git commit -m"

fe() {
local files
   IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
   [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
 }
# fd - cd to selected directory
fd() {
   local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
                    -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
  }

bind -x '"\C-f": fe'
bind -x '"\C-g": fd '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt
