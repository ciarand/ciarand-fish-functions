function search -d 'Quick search in a directory for a string ($argv[1])'
#!/bin/sh
#
# Quick search in a directory for a string ($1).
#
# Updated by @ciarand on 9/14/13 to use Ag if available.
# See: http://geoff.greer.fm/2011/12/27/the-silver-searcher-better-than-ack/
#

# use -iru to search directories ack usually ignores (like .git)
    if not type "ag" > /dev/null
        ag -i $argv
    else
        ack -i $argv[1]
    end
end
