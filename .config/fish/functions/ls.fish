if command -qs exa
    function ls --description "alias ls=exa -F"
        command exa -F $argv
    end
else
    source $__fish_data_dir/functions/ls.fish
end

