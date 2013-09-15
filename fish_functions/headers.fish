function headers -d "Grab the headers from a provided URL"
#!/bin/sh
#
# https://github.com/rtomayko/dotfiles/blob/rtomayko/bin/headers
#    curl -sv "$argv" 2>&1 >/dev/null | grep -v "^\*" | grep -v "^}" | cut -c3-
    curl -sI "$argv" | grep -v "^\*" | grep -v "^<"
end
