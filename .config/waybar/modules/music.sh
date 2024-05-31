#!/bin/bash

echo "$(playerctl metadata artist | sed 's/&/&amp;/') ~ $(playerctl metadata title | sed 's/&/&amp;/')" 

