#!/bin/sh

echo "$(playerctl metadata artist | sed 's/&/&amp;/g') ~ $(playerctl metadata title | sed 's/&/&amp;/g')"

