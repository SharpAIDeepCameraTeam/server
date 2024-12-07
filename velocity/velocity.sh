#!/bin/bash

while [ true ]; do
    java -Xms128M -Xmx128M -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -jar velocity.jar

    echo Server restarting...
    echo Press CTRL + C to stop.
done