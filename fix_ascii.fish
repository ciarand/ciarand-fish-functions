function fix_ascii --description 'Fix any problems with Ascii encoding and convert line endings to Unix (lf)'
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
