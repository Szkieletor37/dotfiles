# insert for Alacritty 
cd ~

export TERM="xterm-256color"

export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export DISPLAY=localhost
#export WAYLAND_DISPLAY=alacritty
source $HOME/.zplug/init.zsh

alias ls='ls --color=auto'
alias rm='rm -i'
alias vim='/usr/local/bin/vim'

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# will run compinit -d "${ZPLUG_HOME}/zcompdump" at this line
bindkey -v
x-copy-region-as-kill () {
  zle copy-region-as-kill
  print -rn $CUTBUFFER | xsel -i -b
}
zle -N x-copy-region-as-kill
x-kill-region () {
  zle kill-region
  print -rn $CUTBUFFER | xsel -i -b
}
zle -N x-kill-region
x-yank () {
  CUTBUFFER=$(xsel -o -b </dev/null)
  zle yank
}
zle -N x-yank

bindkey -e '^[C' x-copy-region-as-kill
bindkey -e '^W' x-kill-region
bindkey -e '^Y' x-yank

export LANG=ja_JP.UTF-8
if zplug check "bhilburn/powerlevel9k"; then
	DEFAULT_FOREGROUND=096
	DEFAULT_BACKGROUND=232
	POWERLEVEL9K_MODE='nerdfont-complete'
	POWERLEVEL9K_PROMPT_ON_NEWLINE=true
	POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
	POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{cyan}╭'
	POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=$'%F{cyan}╰%F{cyan}\ue285%F{152}\ue285%F{231}\ue285 '
	POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs status time root_indicator)
	POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0b4'
	POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0b6'
	
	POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

	POWERLEVEL9K_OS_ICON_BACKGROUND='238'
	POWERLEVEL9K_OS_ICON_FOREGROUND='123'

	POWERLEVEL9K_CONTEXT_TEMPLATE="\uf109  `hostname`"
	POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='236'
	POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='123'
	POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='123'
	POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
	POWERLEVEL9K_DIR_HOME_BACKGROUND='123'
	POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
	POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='123'
	POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
	POWERLEVEL9K_DIR_ETC_BACKGROUND='123'
	POWERLEVEL9K_DIR_ETC_FOREGROUND='black'
# for alacritty
  POWERLEVEL9K_HOME_ICON='\uf015 '
  POWERLEVEL9K_HOME_SUB_ICON='\uf07c '
  POWERLEVEL9K_FOLDER_ICON='\ue5ff '
  POWERLEVEL9K_ETC_ICON='\uf013 '
  POWERLEVEL9K_DIR_PATH_SEPARATOR=' /'

	POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
	POWERLEVEL9K_VCS_CLEAN_BACKGROUND='078'
	POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'

	POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
	POWERLEVEL9K_STATUS_OK_BACKGROUND="239"
	POWERLEVEL9K_STATUS_ERROR_FOREGROUND="174"
	POWERLEVEL9K_STATUS_ERROR_BACKGROUND="239"

	POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
	POWERLEVEL9K_TIME_FOREGROUND="174"
	POWERLEVEL9K_TIME_BACKGROUND="238"

fi

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load 

# opam configuration
test -r /home/szkieletor/.opam/opam-init/init.zsh && . /home/szkieletor/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

