#!/usr/bin/env sh
exec java \
	-XX:+UseZGC -XX:+ZGenerational \
	-Xms12G -Xmx12G -XX:+UseLargePages -XX:+AlwaysPreTouch \
	-Xlog:async -Xlog:gc+init -Xlog:gc*=info:logs/gc.log:time:filecount=1,filesize=100M \
	-jar fabric-server-launch.jar --nogui
