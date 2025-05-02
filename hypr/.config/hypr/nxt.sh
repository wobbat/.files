#!/bin/bash

# Exit fullscreen on current window
hyprctl dispatch fullscreen 0

# Small delay to allow window state to update
sleep 0.3

# Cycle to next window
hyprctl dispatch cyclenext

# Small delay to let new window gain focus
sleep 0.3

# Enter fullscreen on the newly focused window
hyprctl dispatch fullscreen 1

