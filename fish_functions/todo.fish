function todo -d "Creates something for me to do"
#
# Creates something for me to do.
#
# Taken from: https://github.com/holman/dotfiles
#
# I've used literally every todo list, app, program, script, everything. Even
# the ones you are building and haven't released yet.
#
# I've found that they're all nice in their nice ways, but I still don't use
# them, thus defeating the purpose of a todo list.
#
# All `todo` does is put a file on my Desktop with the filename given. That's
# it. I aggressively prune my desktop of old tasks and keep one or two on there
# at a time. Once I've finished a todo, I just delete the file. That's it.
#
# Millions of dollars later and `touch` wins.

# Run our new web 2.0 todo list application and raise millions of VC dollars.
    touch ~/Desktop/"$argv"
end