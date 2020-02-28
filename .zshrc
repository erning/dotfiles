# .zshrc

# path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

#
# prompt
#
eval "$(starship init zsh)"

#
# homebrew
#
if [[ $(uname -s) == "Linux" ]]; then
    export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi
# alias brew "env PATH="(string join ':' $homebrew_paths)" brew"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=86400

#
# python
#

# pip should only run if there is a virtualenv currently activated
# cache pip-installed packages to avoid re-downloading
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE="$HOME/.cache/pip"

#
# rust
#
export PATH="$HOME/.cargo/bin:$PATH"

#
# golang
#
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# ~/bin
export PATH="$HOME/bin:$PATH"

# Tips and Tricks
export CDPATH=.:~
export HISTIGNORE="&:ls:ls *:[bf]g:exit"

# alias
alias ls='ls -G'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias spacevim="env nvim -u $HOME/.SpaceVim/vimrc"

# colors in manual pages
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}
