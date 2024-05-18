#!/bin/bash

PROFILE=$(cat /sys/firmware/acpi/platform_profile)

if [ $PROFILE == "low-power" ]
then
    ICON="󱑲"
fi

if [ $PROFILE == "balanced" ]
then
    ICON="󱑳"
fi

if [ $PROFILE == "performance" ]
then
    ICON="󱑴"
fi

echo -e "$ICON  $PROFILE"
