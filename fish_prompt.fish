function fish_prompt --description 'Write out the prompt'
    echo (begin;
        if test $status = 0
            set_color blue;
        else
            set_color red;
        end;
    end;
    begin;
        echo "❯";
    end;
    begin;
        set_color normal;
    end;);
end
