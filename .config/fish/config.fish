if not status --is-interactive
    exit
end

# path
set fish_user_paths /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin

#
# homebrew
#
if test (uname -s) = Linux; and test -d /home/linuxbrew/.linuxbrew
    set -p fish_user_paths \
        /home/linuxbrew/.linuxbrew/bin \
        /home/linuxbrew/.linuxbrew/sbin
end
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
alias grep 'grep --color=auto'
alias fgrep 'fgrep --color=auto'
alias egrep 'egrep --color=auto'
alias rm 'rm -i'
alias mv 'mv -i'
alias cp 'cp -i'

# locale
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

# less color scheme
set -x LESS_TERMCAP_mb (printf '\e[1;32m')
set -x LESS_TERMCAP_md (printf '\e[1;32m')
set -x LESS_TERMCAP_me (printf '\e[0m')
set -x LESS_TERMCAP_se (printf '\e[0m')
set -x LESS_TERMCAP_so (printf '\e[01;33m')
set -x LESS_TERMCAP_ue (printf '\e[0m')
set -x LESS_TERMCAP_us (printf '\e[1;4;31m')


#
# prompt
#
if command -qs starship
    starship init fish | source
end

