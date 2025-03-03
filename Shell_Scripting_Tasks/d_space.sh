#!/bin/bash
threshold=20
available=$(df --output=pcent / | tail -1 | tr -dc '0-9')

if [ "$available" -ge "$threshold" ]; then
    echo "Warning: Disk space is below $threshold%!"
else
    echo "Disk space is sufficient."
fi

