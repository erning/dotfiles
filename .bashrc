#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
pathremove () {
    local IFS=':'
    local NEWPATH
    local DIR
    local PATHVARIABLE=${2:-PATH}
    for DIR in ${!PATHVARIABLE} ; do
        if [ "$DIR" != "$1" ] ; then
            NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
        fi
    done
    export $PATHVARIABLE="$NEWPATH"
}

pathexist () {
    local IFS=':'
    local DIR
    local PATHVARIABLE=${2:-PATH}
    for DIR in ${!PATHVARIABLE} ; do
        if [ "$DIR" = "$1" ] ; then
            echo "$DIR"
        fi
    done
}

pathprepend () {
    if [ -z `pathexist $1` ] ; then
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
    fi
}

pathappend () {
    if [ -z `pathexist $1` ] ; then
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
    fi
}

# path
if (shopt -q login_shell); then
    if [[ "$OSTYPE" == "darwin"* ]] ; then
        setopt -s nullglob
        for v in /etc/paths /etc/paths.d/*; do
            PREFER_PATH="$PREFER_PATH:`paste -sd ':' $v`"
        done
        setopt -u nullglob
    fi
    
    CLEAN_PATH=( /sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin)
    for v in "${CLEAN_PATH[@]}" ; do
        pathremove "$v" PREFER_PATH
        PREFER_PATH="$v:$PREFER_PATH"
    done

    CUSTOM_PATH=$PATH
    oIFS=$IFS
    IFS=:
    for v in $PREFER_PATH; do
        pathremove "$v" CUSTOM_PATH
    done
    IFS=$oIFS
    unset oIFS

    export PATH="$CUSTOM_PATH:$PREFER_PATH"

    unset CUSTOM_PATH
    unset PREFER_PATH
    unset CLEAN_PATH
fi


#
# homebrew
#
export HOMEBREW_VERBOSE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_AUTO_UPDATE_SECS=86400
export HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK=1
export HOMEBREW_CURL_RETRIES=3

#
# python
#

# pip should only run if there is a virtualenv currently activated
# cache pip-installed packages to avoid re-downloading
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE="$HOME/.cache/pip"

export PYTHONDONTWRITEBYTECODE=true

#
# rust
#
pathprepend "$HOME/.cargo/bin"

#
# golang
#
export GOPATH="$HOME/.go"
pathprepend "$GOPATH/bin"

# ~/bin
pathprepend "$HOME/bin"

# Tips and Tricks
export CDPATH=.:~
export HISTIGNORE="&:ls:ls *:[bf]g:exit"

# alias
case "$OSTYPE" in
    linux*) alias ls='ls --color=auto' ;;
    *) alias ls='ls -G' ;;
esac
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# vi
command -v nvim >/dev/null 2>&1 && alias vi='nvim' 
[[ -d "$HOME/.SpaceVim/vimrc" ]] \
    && alias spacevim="nvim -u $HOME/.SpaceVim/vimrc"

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

unset pathremove
unset pathexist
unset pathprepend
unset pathappend

export EDITOR='vim'

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] \
    && . "/usr/local/etc/profile.d/bash_completion.sh"

#
# prompt
#

# if [ "$(id -u)" != "0" ]; then
#     PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] '
# else
#     PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
# fi

eval "$(starship init bash)"
