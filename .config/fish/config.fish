if not status --is-interactive
    exit
end

# path
if status --is-login
    if test (uname -s) = Darwin
        # avoid path_helper to reorder the path entries
        set -l PREFER_PATH
        for v in /etc/paths /etc/paths.d/*
            if test -r $v
                set PREFER_PATH $PREFER_PATH (cat $v)
            end
        end
    end

    # keep clean path entries in the front
    set -l CLEAN_PATH /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin
    for v in $CLEAN_PATH[-1..1]
        if set -l i (contains -i $v $PREFER_PATH)
            set -e PREFER_PATH[$i]
        end
        set PREFER_PATH $v $PREFER_PATH
    end
    
    # keep the custom path
    set -l CUSTOM_PATH $PATH
    for v in $PREFER_PATH
        if set -l i (contains -i $v $CUSTOM_PATH)
            set -e CUSTOM_PATH[$i]
        end
    end

    set -gx PATH $CUSTOM_PATH $PREFER_PATH
end


#
# homebrew
#
if test (uname -s) = Linux; and test -d /home/linuxbrew/.linuxbrew
    set -x PATH \
        /home/linuxbrew/.linuxbrew/bin \
        /home/linuxbrew/.linuxbrew/sbin \
        $PATH
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
if not contains "$HOME/.cargo/bin" $PATH
    set -x PATH "$HOME/.cargo/bin" $PATH
end

#
# golang
#
set -x GOPATH "$HOME/.go"
if not contains "$GOPATH/bin" $PATH
    set -x PATH "$GOPATH/bin" $PATH
end

# ~/bin
if not contains "$HOME/bin" $PATH
    set -x PATH "$HOME/bin" $PATH
end

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

