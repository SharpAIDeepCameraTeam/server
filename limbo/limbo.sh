#!/bin/bash

while [ true ]; do
    java -Xms32M -Xmx32M -XX:+UseG1GC -XX:G1HeapRegionSize=1M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -jar limbo.jar

    echo Limbo restarting...
    echo Press CTRL + C to stop.
done