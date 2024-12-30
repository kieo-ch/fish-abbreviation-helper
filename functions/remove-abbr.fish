function remove-abbr
    set abbr_path "$__fish_config_dir/conf.d/abbreviations.fish"
    if test -z "$argv[1]"
        echo "Usage: $(status function) <trigger>"
        return 1
    end

    cp $abbr_path /tmp/abbr-old
    sed -I .bac "/abbr -a $argv[1]\ /d" $abbr_path

    if diff /tmp/abbr-old $abbr_path &>/dev/null
        set_color red
        echo -n "Error: couldn't find an abbreviation named "
        set_color normal
        echo "'$argv[1]'"
        return 1
    end

    git diff --color=always --unified=0 /tmp/abbr-old $abbr_path | tail -1
    abbr --erase "$argv[1]"
    source $abbr_path
end
