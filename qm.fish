function qm --description Changes\ working\ directory\ to\ one\ of\ the\ \'shortcuts\'\ set\ in\ \~/shortcuts
    if not test $argv;
        ls ~/shortcuts;
        echo "Please select a shortcut";
        read target;
        set target ~/shortcuts/$target;
    else;
        set target ~/shortcuts/$argv;
    end;

    set target (echo $target | sed '$s/@$//');

    if test -e $target;
        echo "Switching to $target";
        cd $target;
    else if test -e (echo $target | sed '$s/.$//');
        echo "Switching to $target";
        cd $target;
    else;
        echo "No such shortcut";
    end;
    set -e target;
end;
