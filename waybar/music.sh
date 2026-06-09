#!/bin/bash

title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

# if nothing playing
if [ -z "$title" ]; then
    echo "   No music"
    exit
fi

# escape GTK markup characters
title=$(echo "$title" | sed 's/&/\&amp;/g')
artist=$(echo "$artist" | sed 's/&/\&amp;/g')

# combine title and artist
text="$title — $artist"

# limit length
max=30
if [ ${#text} -gt $max ]; then
    text="${text:0:$max}..."
fi

echo "   $text"
