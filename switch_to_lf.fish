function switch_to_lf --description 'Fix any problems with line endings by converting the passed files / folders to LF (Unix) line endings'
    for target in $argv;
        echo "Packing $target into $tmpfile";
        set -l tmpfile (mktemp tmp_archive.zipXXXXXXXXXX).zip;
        zip -ll -qr0 $tmpfile $target; and begin;
            echo "Unpacking "$tmpfile" into $target";
            unzip -aqo $tmpfile; and begin;
                echo "Cleaning "$tmpfile;
                rm $tmpfile;
            end;
        end;
    end;
end
