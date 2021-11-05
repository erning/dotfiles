if command -qs lvim
    function vi --description "alias vi=lvim"
        command lvim $argv
    end
else
    function vi --description "alias vi=vim"
        command vim $argv
    end
end
