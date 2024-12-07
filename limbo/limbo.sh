#!/bin/bash

while [ true ]; do
    java -Xms32M -Xmx32M -XX:+UseG1GC -XX:G1HeapRegionSize=1M -jar limbo.jar

    echo Server restarting...
    echo Press CTRL + C to stop.
done