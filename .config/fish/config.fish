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
set -x HOMEBREW_VERBOSE 1
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x HOMEBREW_AUTO_UPDATE_SECS 86400
set -x HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK 1
set -x HOMEBREW_CURL_RETRIES 3

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


#
# prompt
#
if command -qs starship
    starship init fish | source
end

