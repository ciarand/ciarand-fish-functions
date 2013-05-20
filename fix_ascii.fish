function fix_ascii --description 'Fix any problems with Ascii encoding and convert line endings to Unix (lf)'
    for target in $argv;
        echo "Packing $target into foo.zip";
        zip -qr0 foo.zip $target; and begin;
            echo "Unpacking foo.zip into $target";
            unzip -aqo foo.zip; and begin;
                echo "Cleaning foo.zip";
                rm foo.zip;
            end;
        end;
    end;
end
