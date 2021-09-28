if command -qs nvim
    function vi --description "alias vi=nvim"
        command nvim --clean $argv
    end
else
    function vi --description "alias vi=vim"
        command vim --clean $argv
    end
end
