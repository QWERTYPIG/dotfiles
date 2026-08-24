#!/bin/bash

# 1. Wait a moment for wl-gammarelay-rs to initialize its D-Bus interface
sleep 1

# 2. Load the previous brightness (default to 1.0 if file doesn't exist)
saved_brightness=$(cat ~/.cache/saved_brightness 2>/dev/null || echo "1.0")

# 3. Apply the saved brightness via D-Bus
busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Brightness d "$saved_brightness"

# 4. Watch for any future brightness changes and save them instantly
wl-gammarelay-rs watch {b} | while read -r level; do
    echo "$level" > ~/.cache/saved_brightness
done
