# Use an Ubuntu base image
FROM ubuntu:24.04

# Environment variables for SteamCMD
ENV STEAMCMDDIR="/usr/games"
ENV SERVERDIR="/home/enshrouded/enshroudedserver"

# Set DEBIAN_FRONTEND to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update the system and install dependencies
RUN apt update && \
    apt upgrade -y && \
    apt install -y software-properties-common lsb-release wget ufw cabextract winbind screen xvfb && \
    dpkg --add-architecture i386 && \
    mkdir -pm755 /etc/apt/keyrings && \
    wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
    wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources && \
    apt update && \
    apt install -y --install-recommends winehq-staging && \
    apt install -y software-properties-common && \
    add-apt-repository multiverse && \
    apt update && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    apt install -y steamcmd && \
    apt clean

# Create the enshrouded user
RUN useradd -m enshrouded

# Switch user context to install the server
USER enshrouded
WORKDIR /home/enshrouded

# Download and install the game server with SteamCMD
RUN $STEAMCMDDIR/steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir $SERVERDIR +login anonymous +app_update 2278520 +validate +quit

# Add the server configuration file (replace with your own JSON if you have custom configs)
COPY enshrouded_server.json $SERVERDIR/enshrouded_server.json

# Expose the necessary ports
EXPOSE 15636/tcp
EXPOSE 15637/tcp

# Run the game server
ENTRYPOINT ["wine64", "/home/enshrouded/enshroudedserver/enshrouded_server.exe"]

# Reset DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND=dialog
