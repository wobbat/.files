#!/bin/bash

#!/bin/bash

# Turn off animations (globally)
hyprctl --batch "keyword animations:enabled false"

# Unfullscreen current window
hyprctl dispatch fullscreen 0
sleep 0.05

# Focus next
hyprctl dispatch cyclenext
sleep 0.05

# Fullscreen new window
hyprctl dispatch fullscreen 1

# Re-enable animations
sleep 0.1
hyprctl --batch "keyword animations:enabled true"

