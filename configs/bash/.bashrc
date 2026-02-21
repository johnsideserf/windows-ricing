# Fix ugly directory background colors on Windows
eval "$(dircolors -p | sed 's/OTHER_WRITABLE 34;42/OTHER_WRITABLE 34/' | sed 's/STICKY_OTHER_WRITABLE 30;42/STICKY_OTHER_WRITABLE 34/' | dircolors -)"
