if not status --is-interactive
    exit
end

# path
if status --is-login
    set -l PREFER_PATH
    
    if test (uname -s) = Darwin
        # avoid path_helper to reorder the path entries
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
set -l HOMEBREW_PREFIX
if command -qs /opt/homebrew/bin/brew
    set HOMEBREW_PREFIX (/opt/homebrew/bin/brew --prefix)
end
if command -qs /home/linuxbrew/.linuxbrew/bin/brew
    set HOMEBREW_PREFIX (/home/linuxbrew/.linuxbrew/bin/brew --prefix)
end
if test -n "$HOMEBREW_PREFIX"
    if not contains "$HOMEBREW_PREFIX/sbin" $PATH
        set -x PATH "$HOMEBREW_PREFIX/sbin" $PATH
    end
    if not contains "$HOMEBREW_PREFIX/bin" $PATH
        set -x PATH "$HOMEBREW_PREFIX/bin" $PATH
    end
    if not contains "$HOMEBREW_PREFIX/share/man" $MANPATH
        set -x MANPATH "$HOMEBREW_PREFIX/share/man:" $MANPATH
    end
    if not contains "$HOMEBREW_PREFIX/share/info" $INFOPATH
        set -x INFOPATH "$HOMEBREW_PREFIX/share/info:" $INFOPATH
    end
end
# set -x HOMEBREW_VERBOSE 1
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x HOMEBREW_AUTO_UPDATE_SECS 86400
set -x HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK 1
set -x HOMEBREW_CURL_RETRIES 3

set -l HOMEBREW_MIRROR_PREFIX "https://mirrors.ustc.edu.cn"
set -x HOMEBREW_BOTTLE_DOMAIN "$HOMEBREW_MIRROR_PREFIX/homebrew-bottles"
# set -x HOMEBREW_BREW_GIT_REMOTE="$HOMEBREW_MIRROR_PREFIX/brew.git"
# set -x HOMEBREW_CORE_GIT_REMOTE="$HOMEBREW_MIRROR_PREFIX/homebrew-core.git"


#
# python
#

# pip should only run if there is a virtualenv currently activated
# cache pip-installed packages to avoid re-downloading
set -x PIP_REQUIRE_VIRTUALENV true
set -x PIP_DOWNLOAD_CACHE "$HOME/.cache/pip"

set -x PYTHONDONTWRITEBYTECODE true

#
# java
#
if test -d "$HOME/.local/opt/jdk"
    set -x JAVA_HOME "$HOME/.local/opt/jdk"
    if not contains "$JAVA_HOME/bin" $PATH
        set -x PATH "$JAVA_HOME/bin" $PATH
    end
end
if test -d "$HOME/.local/opt/kotlin"
    if not contains "$HOME/.local/opt/kotlin/bin" $PATH
        set -x PATH "$HOME/.local/opt/kotlin/bin" $PATH
    end
end
if test -d "$HOME/.local/opt/gradle"
    if not contains "$HOME/.local/opt/gradle/bin" $PATH
        set -x PATH "$HOME/.local/opt/gradle/bin" $PATH
    end
end

#
# android
#
if test -d "$HOME/Library/Android"
    set -x ANDROID_HOME "$HOME/Library/Android/sdk"
    if not contains "$ANDROID_HOME/tools" $PATH
        set -x PATH "$ANDROID_HOME/tools" $PATH
    end
    if not contains "$ANDROID_HOME/tools/bin" $PATH
        set -x PATH "$ANDROID_HOME/tools/bin" $PATH
    end
    if not contains "$ANDROID_HOME/platform-tools" $PATH
        set -x PATH "$ANDROID_HOME/platform-tools" $PATH
    end
    if not contains "$ANDROID_HOME/cmdline-tools/latest/bin" $PATH
        set -x PATH "$ANDROID_HOME/cmdline-tools/latest/bin" $PATH
    end
end

#
# rust
#
if test -d "$HOME/.cargo"
    if not contains "$HOME/.cargo/bin" $PATH
        set -x PATH "$HOME/.cargo/bin" $PATH
    end
end

#
# golang
#
set -x GOPATH "$HOME/.go"
if not contains "$GOPATH/bin" $PATH
    set -x PATH "$GOPATH/bin" $PATH
end

# ~/.local/bin
if not contains "$HOME/.local/bin" $PATH
    set -x PATH "$HOME/.local/bin" $PATH
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


#
# direnv
#
if command -qs direnv
    direnv hook fish | source
end

