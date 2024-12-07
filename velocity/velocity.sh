#!/bin/bash

while [ true ]; do
    java -Xms32M -Xmx32M -XX:+UseG1GC -XX:G1HeapRegionSize=2M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -jar velocity.jar

    echo Velocity restarting...
    echo Press CTRL + C to stop.
done