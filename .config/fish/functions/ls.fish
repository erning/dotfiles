if command -qs eza
    function ls --description "alias ls=eza -F"
        command eza -F $argv
    end
else
    source $__fish_data_dir/functions/ls.fish
end

