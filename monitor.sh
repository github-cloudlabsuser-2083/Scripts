#!/bin/bash

echo "CPU and Memory Usage Monitor"

while true
do
    echo "-----------------------------"
    echo "Timestamp: $(date)"
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
    echo "Memory Usage:"
    free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
    sleep 5
done