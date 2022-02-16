HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
REPORTTIME=20
setopt +o nomatch

zstyle :compinstall filename '/home/senoraraton/.zshrc'
zstyle ':vcs_info:git:*' formats '[%b]'
autoload -Uz compinit
autoload -U colors && colors
autoload -Uz vcs_info
precmd() {vcs_info}
compinit

#Aliases

#alias ls="sl" - Uncommentting this will break these aliases.  Fix it.
#ls () { command sl "$@" ;}
alias ls='ls -h --color=auto --group-directories-first'
alias la='ls -alF'
alias ll='ls -A'
alias l='ls -CF --color=auto'
alias less='less -R'
alias watch='watch --color'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias tb="nc termbin.com 9999"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias pingtest="ping -c 5 google.com"
alias gitlog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
alias dirsize='sudo du -sh $PWD/*'

#Prompt

setopt PROMPT_SUBST
export KEYTIMEOUT=1

PS1='%T%F{13}|%n%{$reset_color%}@%F{25}%m|%f%{$fg[green]%}%~%{$reset_color%}%{$fg[white]%}${vim_mode}%'
#PS1='%T%{$fg[magenta]%}|%n%{$reset_color%}@%F{21}%m%f|%{$fg[green]%}%~%{$reset_color%}%{$fg[white]%}${vim_mode}%'

RPROMPT='%F{57}${vcs_info_msg_0_}%f%b'
#'${vcs_info_msg_0_}'
#Config vim indicator -----------------------
vim_ins_mode="%{$fg[green]%}|%{$reset_color%}"
vim_cmd_mode="%{$fg[red]%}|%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}

function zle-line-finish {
  vim_mode=$vim_ins_mode
}

zle -N zle-line-finish
zle -N zle-keymap-select
#End Config vim indicator -------------------

#Env Vars
export LANG=en_US.UTF-8
export TERM=rxvt-unicode
export PATH=/home/senoraraton/.sdkman/candidates/gradle/current/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/include:/home/senoraraton/.cabal/bin:/home/senoraraton/.ghcup/bin:/usr/local/lib:/usr/lib:/home/senoraraton/.local/bin
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
export GOPATH=/home/senoraraton/.config/go
export PATH="$PATH:$HOME/.config/go/bin"

#source ~/scripts/Stone/stonerefresh.sh
