#!/bin/bash
#Commander-ShepardN7
ARTIST=$(playerctl --player=spotify metadata artist)
ALBUM=$(playerctl --player=spotify metadata album)
# Get player status
STATUS=$(playerctl --player=spotify status 2>/dev/null)

# Display informations
if [ "$STATUS" == "Playing" ] || [ "$STATUS" == "Paused" ]; then
    if (( ${#ARTIST} > 16 )); then
        echo "${ARTIST:0:16}..."
    else
        echo "$ARTIST"
    fi
    if (( ${#ALBUM} > 16 )); then
    echo "${ALBUM:0:16}..."
    else
        echo "$ALBUM"
    fi
else
    echo "-"
    echo "-"
fi


