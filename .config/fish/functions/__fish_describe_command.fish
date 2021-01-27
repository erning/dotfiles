if test (uname) = Darwin
    function __fish_describe_command; end
else
    source $__fish_data_dir/functions/__fish_describe_command.fish
end
