function add-abbr
    set abbr_path "$__fish_config_dir/conf.d/abbreviations.fish"
    if test -z "$argv[2]"
        echo "Usage: $(status function) <trigger> <command>"
        return 1
    end

    # Error: conflicting abbreviations
    if grep -E "^abbr -a $argv[1]\ " $abbr_path &>/dev/null
        set_color red

        echo -n "Error: '$argv[1]' conflicts with an existing abbreviation to: "
        set_color normal
        grep -E "^abbr -a $argv[1]\ " $abbr_path | cut -d' ' -f4-

        return 1
    end

    # Warning: conflicting command
    if which $argv[1] &>/dev/null
        set_color yellow
        echo "Warning: '$argv[1]' conflicts with an existing command - $(which $argv[1])"
        echo -n "If you don't want to override that command then run: "
        set_color normal
        echo "remove-abbr $argv[1]"
    end

    cp $abbr_path /tmp/abbr-old
    echo "abbr -a $argv[1] $argv[2..-1]" >>$abbr_path
    git diff --color=always --unified=0 /tmp/abbr-old $abbr_path | tail -1
    source $abbr_path
end
