# function jump {
#     cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
# }
function jump
    cd $MARKPATH/$argv[1] ^ /dev/null > /dev/null; or echo "No such mark: "$argv[1]
end
