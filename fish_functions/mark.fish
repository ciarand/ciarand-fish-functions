# function mark {
#     mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
# }
function mark
    mkdir -p $MARKPATH; ln -s (pwd) $MARKPATH/$argv[1]
end
