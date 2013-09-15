function search -d 'Quick search in a directory for a string ($argv[1])'
#!/bin/sh
#
# Quick search in a directory for a string ($1).
#

# use -iru to search directories ack usually ignores (like .git)
    ack -i $argv[1]
end
