#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -F
iptables -t nat -F
iptables -t mangle -F

iptables -x
iptables -t nat -X
iptables -t mangle -X

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i enp0s3 --match state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i enp0s3 -p tcp -m multiport --dports 22,80 -j ACCEPT

iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -o enp0s3 --match state --state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT



iptables -t nat -A POSTROUTING -o enp0s3 -s 10.0.2.15/24 -j MASQUERADE


iptables -A INPUT -s 192.168.3.0/26 -j ACCEPT
iptables -A OUTPUT -s 192.168.3.0/26 -j ACCEPT



