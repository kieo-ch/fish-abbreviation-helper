# FIXME: Fix 0 found bug
function als -d "List all aliases"
    set -a triggers $(alias | grep "$argv" | cut -d' ' -f2)
    set -a triggers $(abbr | grep "$argv" | cut -d' ' -f4)
    set -a cmds $(alias | grep "$argv" | cut -d' ' -f3-)
    set -a cmds $(abbr | grep "$argv" | cut -d' ' -f5-)

    set max_length 0
    for str in $triggers
        set len (string length $str)
        if test $len -gt $max_length
            set max_length $len
        end
    end

    if test (count $triggers) -gt 0
        for i in (seq (count $triggers))
            printf "%$(echo -n $max_length)s: %s\n" $triggers[$i] $(echo $cmds[$i] | sed "s/^'//;s/'\$//")
        end | grep "$argv"
    end
end
