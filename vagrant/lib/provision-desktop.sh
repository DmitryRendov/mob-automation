#!/bin/bash

apt-get update -y
apt-get upgrade -y

apt-get install -y build-essential \
	mc \
	htop \
	gdm3 \
	gnome-core \
  gnome-tweak-tool \
  gitk \
	git-gui \
	ruby-dev

# Setup access to the Docker container VM
echo '192.168.56.99 stage.minecraft.of.by' >> /etc/hosts

# Auto cleanup
apt-get autoremove -y
