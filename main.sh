#!/bin/bash
trap 'echo Stopping Apache 2 ... && httpd -k stop -f ~/eaglercraft-server/apache.conf && echo Apache 2 stopped && Stopping BungeeCord and Bukkit ... && pkill java && echo BungeeCord and Bukkit stopped' SIGTERM
echo Starting Apache 2 ...
httpd -k start -f ~/eaglercraft-server/apache.conf
echo Apache 2 started
echo Starting BungeeCord and Bukkit ...
chmod +x ./java/bungee_command/run_unix.sh
chmod +x ./java/bukkit_command/run_unix.sh
cd ./java/bungee_command
sudo ./run_unix.sh > /dev/null 2>&1 &
cd ../bukkit_command && sudo ./run_unix.sh