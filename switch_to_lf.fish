function switch_to_lf --description 'Fix any problems with line endings by converting the passed files / folders to LF (Unix) line endings'
    for target in $argv;
        echo "Packing $target into $tmpfile";
        set -l tmpfile (mktemp tmp_archive.XXXXXXXXXX)
        set -l tmpzipfile $tmpfile.zip;
        zip -ll -qr0 $tmpzipfile $target; and begin;
            echo "Unpacking "$tmpzipfile" into $target";
            unzip -aqo $tmpzipfile; and begin;
                echo "Cleaning "$tmpzipfile;
                rm $tmpfile $tmpzipfile;
            end;
        end;
    end;
end
