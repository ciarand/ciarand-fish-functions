# The goal here is to have ⚡ appear on the left,
# and have most of the information appear on the right

function fish_right_prompt --description 'Print the left part of the prompt'
    set -l git_prompt (begin;
        # git prompt
        git rev-parse ^ /dev/null; and begin;
            set -l current_branch (git rev-parse --abbrev-ref HEAD ^ /dev/null);
            set -l branch_status (begin;
                set_color (git diff --quiet --ignore-submodules HEAD ^ /dev/null; and echo blue; or echo red;);
                echo "●";
                set_color normal;
            end;);
            echo "($current_branch)" "$branch_status";
        end;
    end;);
    set -l current_directory (set_color yellow; echo $PWD | sed -e "s|^$HOME|~|"; set_color normal;);
    echo "$git_prompt""$current_directory";
end
