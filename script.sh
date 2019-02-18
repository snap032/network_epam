#!/bin/bash
       
sudo apt-get update
sudo tee -a /etc/network/interfaces << EOF
auto enp0s8
iface enp0s8 inet static
address 192.168.3.5
netmask 255.255.255.192

pre-up iptables-restore /etc/ip
EOF

# DHCP Server 
sudo apt-get -y install isc-dhcp-server
sudo apt-get install git -y
git clone https://github.com/snap032/network_epam.git
mv network_epam/dhcpd.conf /etc/dhcp/dhcpd.conf
sudo sed -i 's/INTERFACES=""/INTERFACES="enp0s8"/' /etc/default/isc-dhcp-server
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
sudo service isc-dhcp-server restart

#NAT MASQUERADE
sudo iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE
sudo bash -c "iptables-save > /etc/ip"
sudo chmod +x /etc/ip


#DNS Server

sudo apt-get install bind9 bind9utils -y
sudo sed -i 's/OPTIONS=" -u bind"/OPTIONS="-4 -u bind"/' /etc/default/bind9

