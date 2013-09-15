# function unmark {
#     rm -i "$MARKPATH/$1"
# }
function unmark
    rm -i $MARKPATH/$argv[1]
end
