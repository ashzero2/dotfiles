# vim:foldmethod=marker:

# Zim configs {{{

setopt HIST_IGNORE_ALL_DUPS
WORDCHARS=${WORDCHARS//[\/]}
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# -- Post-init module configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# -- Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# }}}

# === PERSONAL CONFIGS === 

# Exports {{{
export PATH="$HOME/.local/bin:$PATH"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR='nvim'

#colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Fzf rice
export FZF_DEFAULT_OPTS='
  --color fg:#d4be98,bg:#282828
  --color bg+:#7daea3,fg+:#282c34,hl:#d4be98,hl+:#1e222a,gutter:#928374
  --color pointer:#282828,info:#d4be98,border:#565c64
  --border'

#}}}

# Plugins {{{
eval "$(starship init zsh)"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions bgnotify)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
# }}}

# Aliases {{{
# -- xbps alias
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
alias xrr="sudo xbps-remove -Ro"
alias xq="xbps-query"
alias xqs="xbps-query -Rs"

# -- Cd alias
alias cd..="cd .."
alias cd...='cd ../..'
alias c$="cd ~"
alias jdir="cd ~/Workspace/java/src"

# -- app alias
alias zathura="devour zathura"
alias vim="nvim"
alias nv="nvim"
alias rr="ranger"
alias poly="kill $(pidof polybar) && ./.config/polybar/launch.sh"
alias code="code-oss"
alias gc="git clone"

# -- Other alias
alias ff="feh --bg-scale"
alias gpg="gpg2"
alias q="exit"
# }}}

# Misc {{{
# -- color wrapper for ps_mem
ps_mem() {
	doas ps_mem "$@" \
		| GREP_COLORS='mt=1;32' egrep --color=auto --color=always "KB|KiB|$" \
		| GREP_COLORS='mt=0;33' egrep --color=auto --color=always 'MB|MiB|$' \
		| GREP_COLORS='mt=1;31' egrep --color=auto --color=always "GB|GiB|$"

}

# -- Need to be at last
alias ls="logo-ls"
export PATH="$HOME/.node_modules:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ash-fetch
# }}}
