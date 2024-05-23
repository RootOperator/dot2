#!/bin/bash

MUTED=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -P -o ": \K.*\w")

if [ $MUTED == "no" ]
then
    echo "󰍬"
else
    echo "󰍭"
fi

