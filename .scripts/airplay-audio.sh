#!/bin/bash

find_raop_sink() {
    for i in {1..3}; do
        RAOP_SINK=$(pactl list short sinks | grep "raop" | awk '{print $2}')
        if [ -n "$RAOP_SINK" ]; then
            echo "$RAOP_SINK"
            return 0
        fi
        sleep 1
    done
    return 1
}

# Check if module-raop-discover is loaded
if pactl list modules short | grep -q "module-raop-discover"; then
    echo "Unloading module-raop-discover..."
    pactl unload-module module-raop-discover
else
    echo "Loading module-raop-discover..."
    pactl load-module module-raop-discover

    # Set the default sink to the RAOP sink
    RAOP_SINK=$(find_raop_sink)
    if [ $? -eq 0 ]; then
        pactl set-default-sink "$RAOP_SINK"
        echo "Default sink set to RAOP sink: $RAOP_SINK"

        # Move all sink inputs to the new RAOP sink
        for SINK_INPUT in $(pactl list short sink-inputs | awk '{print $1}'); do
            #echo "output $RAOP_SINK"
            pactl move-sink-input $SINK_INPUT "$RAOP_SINK"
        done
    else
        echo "No RAOP sink found."
    fi
fi
