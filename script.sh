#!/bin/bash
       
sudo apt-get update
sudo tee -a /etc/network/interfaces << EOF
auto enp0s8
iface enp0s8 inet static
address 122.168.3.5
netmask 255.255.255.192
EOF

# DHCP Server 
sudo apt-get -y install isc-dhcp-server
sudo apt-get install git -y
git https://github.com/snap032/network_epam.git
mv network_epam/dhcpd.conf /etc/dhcp/dhcpd.conf
sudo sed -i 's/INTERFACES=""/INTERFACES="enp0s8"/' /etc/default/isc-dhcp-server
sudo service isc-dhcp-server restart

#DNS Server
sudo apt-get install bind9 bind9utils -y
sudo sed -i 's/OPTIONS=" -u bind"/OPTIONS="-4 -u bind"/' /etc/default/bind9

