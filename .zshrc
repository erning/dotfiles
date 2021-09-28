#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# path
typeset -U path
if [[ -o login ]]; then
    local PREFER_PATH
    typeset -U PREFER_PATH
    if [[ "$OSTYPE" == darwin* ]] ; then
        # avoid path_helper to reorder the path entries
        setopt NULL_GLOB
        for v in /etc/paths /etc/paths.d/*; do
            if [[ -r $v ]] ; then
                PREFER_PATH+=("${(@f)$(cat $v)}")
            fi
        done
        unsetopt NULL_GLOB
    fi

    # keep clean path entries in the front
    local CLEAN_PATH=("/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/usr/sbin" "/bin" "/sbin")
    PREFER_PATH=()
    for v in ${(O)CLEAN_PATH}; do
        PREFER_PATH[${PREFER_PATH[(i)$v]}]=()
    done
    PREFER_PATH=($CLEAN_PATH $PREFER_PATH)
    
    # keep the custom path
    local CUSTOM_PATH=($path)
    for v in $PREFER_PATH; do
        CUSTOM_PATH[${CUSTOM_PATH[(i)$v]}]=()
    done

    path=($CUSTOM_PATH $PREFER_PATH)
fi
export PATH
#export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

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
# java
#
if [[ -d "$HOME/.local/opt/jdk" ]]; then
    export JAVA_HOME="$HOME/.local/opt/jdk"
    path=("$JAVA_HOME/bin" $path)
fi
[[ -d "$HOME/.local/opt/kotlin" ]] \
    && path=("$HOME/.local/opt/kotlin/bin" $path)
[[ -d "$HOME/.local/opt/gradle" ]] \
    && path=("$HOME/.local/opt/gradle/bin" $path)

#
# rust
#
if [[ -d "$HOME/.cargo" ]]; then
    path=("$HOME/.cargo/bin" $path)
fi

#
# golang
#
export GOPATH="$HOME/.go"
path=("$GOPATH/bin" $path)

# ~/.local/bin
path=("$HOME/.local/bin" $path)

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

export EDITOR='vim'

#
# prompt
#
eval "$(starship init zsh)"

