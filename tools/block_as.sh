#! /bin/sh

# Where our iptables binary is
IPT='/usr/sbin/iptables'

# Detect the main network interface
NETWORK=$(ip route | grep default | awk '{print $5}' | head -n1)
echo "Using network interface: $NETWORK"

# Below are the autonomus system (AS) numbers for some BAD networks
# AS12958 -- skylink.ru
# AS8570 -- Lipetsk
AS_TO_BAN=""

# Exceptions for some cases (eg whitelist)
ALLOW_IPs="192.168.56.0/24 10.10.10.0/24 51.254.133.16/32 78.10.180.212/32"
ALLOW_MACs="74:D4:35:5B:62:EE"

# Manual banned IPs
BANNED_IPs=""

echo ""
echo "Clean up..."

# Some hack - how to remove all rules referring to the chain in iptables
iptables-save | grep -v -- '-j NET2BAN' | iptables-restore

echo ""
echo "Blocking WHOLE Networks"
$IPT -N NET2BAN
$IPT -F NET2BAN

# Allow for some user by their IPs
for userip in $ALLOW_IPs; do
  $IPT -A NET2BAN -s $userip -j ACCEPT
done

# Allow TCPShield IPs
#curl -s https://tcpshield.com/v4/ | while read -r ip; do
#  $IPT -A NET2BAN -s $ip -j ACCEPT
#done

# Allow for some user by their MACs
for mac in $ALLOW_MACs; do
  $IPT -A NET2BAN -m mac --mac-source $mac -j ACCEPT
done

# SYN rate limiting for Minecraft port with logging
$IPT -A NET2BAN -p tcp --syn --dport 25565 -m limit --limit 10/second --limit-burst 20 -j RETURN
$IPT -A NET2BAN -p tcp --syn --dport 25565 -j LOG --log-prefix "SYN flood attempt: " --log-level 4
$IPT -A NET2BAN -p tcp --syn --dport 25565 -j DROP


# Add some logging
$IPT -A NET2BAN -m limit --limit 5/second -j LOG --log-prefix "Banned Minecraft: " --log-level 4

# Block for others
$IPT -A NET2BAN -j DROP

## Here, we collect all ip-ranges and block access
for as in $AS_TO_BAN; do
    for ip in `whois -h whois.radb.net "!g$as" | grep /`
    do
      $IPT -A INPUT -i $NETWORK -p tcp --dport 25565 -s $ip -j NET2BAN
    done
done

# Ban some IPs from manual list
for userip in $BANNED_IPs; do
  $IPT -A INPUT -i $NETWORK -s $userip -p tcp --dport 25565 -j NET2BAN
done

# Forward ALL the hosts to the MC chain - ONLY when TCPShield is used
$IPT -A INPUT -i $NETWORK -p tcp --dport 25565 -j NET2BAN

echo "Done."
echo ""
