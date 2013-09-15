# The goal here is to have "❯" appear on the left,
# and have most of the information appear on the right

function fish_right_prompt --description 'Print the right part of the prompt'
    # config settings
    set -l dirty_color red
    set -l clean_color blue
    set -l directory_color yellow

    # local variables
    set -l true (true; echo $status)
    # git prompt
    set -l git_prompt
    # default dir prompt, may be overwritten by git prompt if applicable
    set -l dir_prompt (set_color $directory_color; prompt_pwd; set_color normal)
    # are we in a git repo?

    set -l is_git_repo (git rev-parse --is-inside-work-tree ^ /dev/null > /dev/null; echo $status)

    if test $is_git_repo = $true
        set -l is_dirty (not git diff --quiet --ignore-submodules HEAD ^ /dev/null > /dev/null; echo $status)

        set -l git_status_color (test $is_dirty = $true; and set_color $dirty_color; or set_color $clean_color);
        set -l git_normal_color (set_color normal);

        set git_prompt (begin
            # variable declarations
            set -l git_meta_branch
            set -l git_meta_tag
            set -l git_character

            # branch
            set -l branch (git rev-parse --abbrev-ref HEAD ^ /dev/null)
            # tag
            set -l current_tag (git describe --always --tag ^ /dev/null)

            # character output
            set git_character (begin
                echo $git_status_color
                echo "♆";
                echo $git_normal_color
            end)

            # Branch output
            set git_meta_branch (begin
                test "$branch" = "master"; or echo "($branch) "
            end)

            # tag output
            set git_meta_tag (begin
                #echo $git_status_color
                echo "["$git_status_color$current_tag$git_normal_color"]"
                #echo $git_normal_color
            end)

            # putting it all together
            echo "$git_character$git_meta_branch$git_meta_tag"
        end);

        # now we overwrite the dir_prompt stuff with a git-specific pwd if necessary
        set -l git_root_path (git rev-parse --show-toplevel)
        set -l git_root (echo $git_root_path | awk -F'/' '{print $NF}')
        set -l current_directory_absolute (pwd)
        set -l current_directory_relative_to_git (echo $current_directory_absolute | sed "s|^"$git_root_path"||")

        set dir_prompt (begin
            set_color $directory_color
            echo "$git_root$current_directory_relative_to_git"
            set_color normal
        end)
    end
    echo "$git_prompt $dir_prompt"
end
