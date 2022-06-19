if command -qs brew; and test -f (brew --prefix)/opt/fzf/shell/key-bindings.fish
    source (brew --prefix)/opt/fzf/shell/key-bindings.fish
end

if functions -q fzf_key_bindings
    function fish_user_key_bindings
        fzf_key_bindings
    end
end

