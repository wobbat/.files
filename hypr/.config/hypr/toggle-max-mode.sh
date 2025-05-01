#!/bin/bash

STATE_FILE="/tmp/hypr-max-mode"

if [ -f "$STATE_FILE" ]; then
    # Turn OFF max mode
    hyprctl dispatch fullscreen 0
    hyprctl dispatch togglefloating
    rm "$STATE_FILE"
else
    # Turn ON max mode
    hyprctl dispatch togglefloating
    hyprctl dispatch fullscreen 1
    touch "$STATE_FILE"
fi
