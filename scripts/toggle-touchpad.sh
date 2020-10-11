#! /bin/sh

# Toggle touchpad status
# Using libinput and xinput

# Use xinput list and do a search for touchpads.
devices="$(xinput list | grep -P '(?<= )[\w\s:]*(?i)(touchpad|synaptics)(?-i).*?(?=\s*id)' -o)"

echo "$devices" | while read device
do
    # If it was activated disable it and if it wasn't disable it
    [[ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" == "1" ]] &&
        xinput disable "$device" ||
        xinput enable "$device"
done >/dev/null 2>&1

