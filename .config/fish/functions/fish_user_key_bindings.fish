if test -f /usr/local/opt/fzf/shell/key-bindings.fish
    source /usr/local/opt/fzf/shell/key-bindings.fish
end

if functions fzf_key_bindings
    function fish_user_key_bindings
        fzf_key_bindings
    end
end

