if command -qs nvim
    function vi --description "alias vi=nvim"
        command nvim $argv
    end
else
    function vi --description "alias vi=vim"
        command vim $argv
    end
end
