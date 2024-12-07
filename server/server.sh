#!/bin/bash

while [ true ]; do
    java -Xms64M -Xmx64M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapRegionSize=4M -jar server.jar nogui

    echo Server restarting...
    echo Press CTRL + C to stop.
done