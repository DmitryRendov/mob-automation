#!/bin/bash -u

server_path=/home/minecraft/mob-servers
src_folder="${server_path}/rc-scripts/jar"

server_ver="1.21.10"
lp_ver="5.5.22"
we_ver="7.3.19"
wg_ver="7.1.0"
is_ver="2.9.12a"

check_proxy="$(/opt/minecraft/bungeecord status | grep 'is not running')"
if [ ! "$check_proxy" ]; then
  echo "Proxy hasn't been stopped. Aborted..."
  exit 1
fi
echo "Update BungeeCord up to the lates stable build"
wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
if [ -f "BungeeCord.jar" ]; then
  rm $server_path/bungeecord/BungeeCord.jar
  mv BungeeCord.jar $server_path/bungeecord/BungeeCord.jar
else 
  echo "BungeeCord binary hasn't been found. Aborting..."
  exit 1
fi

check_lobby="$(/opt/minecraft/lobby status | grep 'is not running')"
if [ ! "$check_lobby" ]; then
  echo "Lobby server hasn't been stopped. Aborted..."
  exit 1
fi

check_survival="$(/opt/minecraft/survival status | grep 'is not running')"
if [ ! "$check_survival" ]; then
  echo "Survival server hasn't been stopped. Aborted..."
  exit 1
fi

check_survival="$(/opt/minecraft/vanilla status | grep 'is not running')"
if [ ! "$check_survival" ]; then
  echo "Vanilla server hasn't been stopped. Aborted..."
  exit 1
fi

check_survival="$(/opt/minecraft/creative status | grep 'is not running')"
if [ ! "$check_survival" ]; then
  echo "Creative server hasn't been stopped. Aborted..."
  exit 1
fi

if [ -f "${src_folder}/paper-latest.jar" ]; then
  echo ""
  echo "Updating server binaries..."
  echo ""
  rm $server_path/{lobby,survival,vanilla,creative}/paper-*.jar

  cp ${src_folder}/paper-latest.jar ${server_path}/lobby/paper-lobby-${server_ver}.jar
  cp ${src_folder}/paper-latest.jar ${server_path}/survival/paper-survival-${server_ver}.jar
  cp ${src_folder}/paper-latest.jar ${server_path}/vanilla/paper-vanilla-${server_ver}.jar
  cp ${src_folder}/paper-latest.jar ${server_path}/creative/paper-creative-${server_ver}.jar
  echo "Done!"
else
  echo "Server binary hasn't been found. Skipping..."
fi

if [ -f "${src_folder}/LuckPerms-Bukkit-${lp_ver}.jar" ]; then
  echo ""
  echo "Updating LuckPerms plugins on each server..."
  echo ""
  rm $server_path/{bungeecord,lobby,survival,vanilla,creative}/plugins/LuckPerms*.jar

  cp ${src_folder}/LuckPerms-Bungee-${lp_ver}.jar ${server_path}/bungeecord/plugins/LuckPerms-Bungee-${lp_ver}.jar
  cp ${src_folder}/LuckPerms-Bukkit-${lp_ver}.jar ${server_path}/lobby/plugins/LuckPerms-Bukkit-${lp_ver}.jar
  cp ${src_folder}/LuckPerms-Bukkit-${lp_ver}.jar ${server_path}/survival/plugins/LuckPerms-Bukkit-${lp_ver}.jar
  cp ${src_folder}/LuckPerms-Bukkit-${lp_ver}.jar ${server_path}/vanilla/plugins/LuckPerms-Bukkit-${lp_ver}.jar
  cp ${src_folder}/LuckPerms-Bukkit-${lp_ver}.jar ${server_path}/creative/plugins/LuckPerms-Bukkit-${lp_ver}.jar
else
  echo "LuckPerms binary hasn't been found. Skipping..."
fi


if [ -f "${src_folder}/worldedit-bukkit-${we_ver}-SNAPSHOT-dist.jar" ]; then
  echo ""
  echo "Updating WE/WG plugins on each server..."
  echo ""
  rm $server_path/{lobby,survival}/plugins/{worldedit-bukkit-*.jar,worldguard-bukkit-*.jar}
  rm $server_path/{vanilla,creative}/plugins/worldedit-bukkit-*.jar

  cp ${src_folder}/worldedit-bukkit-${we_ver}-SNAPSHOT-dist.jar ${server_path}/lobby/plugins/worldedit-bukkit-${we_ver}-SNAPSHOT-dist.jar
  cp ${src_folder}/worldedit-bukkit-${we_ver}-SNAPSHOT-dist.jar ${server_path}/survival/plugins/worldedit-bukkit-${we_ver}-SNAPSHOT-dist.jar
  cp ${src_folder}/worldedit-bukkit-${we_ver}-SNAPSHOT-dist.jar ${server_path}/vanilla/plugins/worldedit-bukkit-${we_ver}-SNAPSHOT-dist.jar
  cp ${src_folder}/worldedit-bukkit-${we_ver}-SNAPSHOT-dist.jar ${server_path}/creative/plugins/worldedit-bukkit-${we_ver}-SNAPSHOT-dist.jar
  cp ${src_folder}/worldguard-bukkit-${wg_ver}-SNAPSHOT-dist.jar ${server_path}/lobby/plugins/worldguard-bukkit-${wg_ver}-SNAPSHOT-dist.jar
  cp ${src_folder}/worldguard-bukkit-${wg_ver}-SNAPSHOT-dist.jar ${server_path}/survival/plugins/worldguard-bukkit-${wg_ver}-SNAPSHOT-dist.jar
else
  echo "LuckPerms binary hasn't been found. Skipping..."
fi

if [ -f "${src_folder}/IllegalStack-${is_ver}.jar" ]; then
  echo ""
  echo "Updating IllegalStack plugins on each server..."
  echo ""
  rm $server_path/survival/plugins/IllegalStack-*.jar

  cp ${src_folder}/IllegalStack-${is_ver}.jar ${server_path}/survival/plugins/IllegalStack-${is_ver}.jar
else
  echo "IllegalStack binary hasn't been found. Skipping..."
fi
