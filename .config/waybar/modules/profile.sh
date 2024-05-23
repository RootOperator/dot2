#!/bin/bash

PROFILE=$(cat /sys/firmware/acpi/platform_profile)

case $PROFILE in
"low-power")
    ICON="󱑲"
    ;;
"balanced")
    ICON="󱑳"
    ;;
"performance")
    ICON="󱑴"
    ;;
esac

echo "$ICON  $PROFILE"
