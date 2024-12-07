#!/bin/bash

while [ true ]; do
    java -Xms64M -Xmx64M -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -jar limbo.jar

    echo Server restarting...
    echo Press CTRL + C to stop.
done