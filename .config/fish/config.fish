if not status --is-interactive
    exit
end

# path
set fish_user_paths /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin

#
# homebrew
#
set homebrew_paths /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin
if test (uname -s) = Linux
    set -p homebrew_paths \
        /home/linuxbrew/.linuxbrew/bin \
        /home/linuxbrew/.linuxbrew/sbin
    set -p fish_user_paths $homebrew_paths
end
alias brew "env PATH="(string join ':' $homebrew_paths)" brew"
set -e homebrew_paths
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_AUTO_UPDATE_SECS 86400

#
# python
#

# pip should only run if there is a virtualenv currently activated
# cache pip-installed packages to avoid re-downloading
set -x PIP_REQUIRE_VIRTUALENV true
set -x PIP_DOWNLOAD_CACHE "$HOME/.cache/pip"

#
# rust
#
set -p fish_user_paths "$HOME/.cargo/bin"

#
# golang
#
set -x GOPATH "$HOME/.go"
set -p fish_user_paths "$GOPATH/bin"

# ~/bin
set -p fish_user_paths "$HOME/bin"

# common alias
alias ll 'ls -lh'
alias grep 'grep --color=auto'
alias fgrep 'fgrep --color=auto'
alias egrep 'egrep --color=auto'
alias rm 'rm -i'
alias mv 'mv -i'
alias cp 'cp -i'

alias spacevim "env SHELL=/bin/bash nvim -u $HOME/.SpaceVim/vimrc"


# colorful manual pages
function man
    env \
        LESS_TERMCAP_mb=(printf "\e[1;31m") \
        LESS_TERMCAP_md=(printf "\e[1;31m") \
        LESS_TERMCAP_me=(printf "\e[0m") \
        LESS_TERMCAP_se=(printf "\e[0m") \
        LESS_TERMCAP_so=(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=(printf "\e[0m") \
        LESS_TERMCAP_us=(printf "\e[1;32m") \
        man $argv
end

# locale
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"


#
# prompt
#
if command -qs starship
    starship init fish | source
end

