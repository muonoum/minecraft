#!/usr/bin/env sh
exec java \
	-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=40 -XX:G1MaxNewSizePercent=50 -XX:G1HeapRegionSize=16M -XX:G1ReservePercent=15 --add-modules=jdk.incubator.vector \
	-Xms12G -Xmx12G -XX:+UseLargePages -XX:+AlwaysPreTouch \
	-Xlog:async -Xlog:gc+init -Xlog:gc*=info:logs/gc.log:time:filecount=1,filesize=100M \
	-jar fabric-server-launch.jar --nogui
