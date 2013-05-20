function qm --description Changes\ working\ directory\ to\ one\ of\ the\ \'shortcuts\'\ set\ in\ \~/shortcuts
    if not test $argv;
        ls ~/shortcuts;
        echo "Please select a shortcut";
        read target;
        set target ~/shortcuts/$target;
    else;
        set -l target ~/shortcuts/$argv;
    end;
    echo $target;
    if test -e $target;
        echo "Switching to $target";
        cd $target;
    else;
        echo "No such shortcut";
    end;
end;
