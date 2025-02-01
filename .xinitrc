picom --vsync --fade-in-step=1 --fade-out-step=1 &
#setxkbmap -option caps:escape &

export XCURSOR_SIZE=24

# Detect if DP-1 is connected
if xrandr | grep -q "^DP-1 connected"; then
    # Use only DP-1
    xrandr --output DP-1 --auto --output eDP-1 --off
else
    # Use only eDP1
    xrandr --output eDP-1 --auto --output DP-1 --off
fi

awesome
