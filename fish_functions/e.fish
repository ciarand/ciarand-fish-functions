function e -d "Open a file using $EDITOR"
# Quick shortcut to an editor.
#
# This means that as I travel back and forth between editors, hey, I don't have
# to re-learn any arcane commands. Neat.
#
# Taken from: https://github.com/holman/dotfiles
#
# USAGE:
#
#   $ e
#   # => opens the current directory in your editor
#
#   $ e .
#   $ e /usr/local
#   # => opens the specified directory in your editor

    if test -z $argv
      eval $EDITOR .
    else
      eval $EDITOR $argv
    end
end