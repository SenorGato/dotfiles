# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/senoraraton/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Aliases

#alias ls="sl" - Uncommentting this will break these aliases.  Fix it.
#ls () { command sl "$@" ;}
alias ls='ls -h --color=auto'
alias la='ls -alF --color=auto'
alias ll='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias tb="nc termbin.com 9999"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias pingtest="ping -c 5 google.com"
autoload -U colors && colors
#Prompt
PS1="%T%{$fg[magenta]%}|%n%{$reset_color%}@%{$fg[blue]%}%m|%{$fg[green]%}%~%{$reset_color%}%{$fg[white]%}|%"
#export PS1="%T|%n@%m|%~$ "

#Env Vars
export LANG=en_US.UTF-8
export TERM=rxvt-unicode
export PATH=/home/senoraraton/.sdkman/candidates/gradle/current/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/include:/home/senoraraton/.cabal/bin:/home/senoraraton/.ghcup/bin:/usr/local/lib:/usr/lib:/home/senoraraton/.local/bin
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
export GOPATH=/home/senoraraton/.config/go
export PATH="$PATH:$HOME/.config/go/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
