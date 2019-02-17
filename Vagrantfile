Vagrant.configure("2") do |config|
  
  config.vm.define "R13" do |R13|
    R13.vm.box = "ubuntu/xenial64"
    R13.vm.hostname = "R13"
    R13.vm.provision "shell", inline: <<-SHELL
    sudo tee -a /etc/network/interfaces << EOF
    auto enp0s8
    iface enp0s8 inet dhcp
    EOF
  SHELL

  end

  config.vm.define "R23" do |R23|
    R23.vm.box = "ubuntu/xenial64"
    R23.vm.hostname = "R23"
    R23.vm.provision "shell", inline: <<-SHELL
    sudo tee -a /etc/network/interfaces << EOF
    auto enp0s8
    iface enp0s8 inet dhcp
    EOF
  SHELL

  end


  config.vm.define "NAT/DHCP/DNS" do |NAT/DHCP/DNS|
    NAT/DHCP/DNS.vm.box = "ubuntu/xenial64"
    NAT/DHCP/DNS.vm.hostname = "NAT/DHCP/DNS"
    NAT/DHCP/DNS.vm.provision "shell", path: "script.sh"

  end

  
  config.vm.define "nginx1" do |nginx1|
    nginx1.vm.box = "ubuntu/xenial64"
    nginx1.vm.hostname = "nginx1"
    nginx1.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install nginx -y
    sudo apt-get install git -y
    sudo rm -rf /var/www/html/*
    git clone https://github.com/snap032/site.git
    mv site/* /var/www/html
    sudo tee -a /etc/network/interfaces << EOF
    auto enp0s8
    iface enp0s8 inet dhcp
    EOF
  SHELL
  end

  config.vm.define "nginx2" do |nginx2|
    nginx2.vm.box = "ubuntu/xenial64"
    nginx2.vm.hostname = "nginx2"
    nginx1.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install nginx -y
    sudo apt-get install git -y
    sudo rm -rf /var/www/html/*
    git clone https://github.com/snap032/site.git
    mv site/* /var/www/html
  SHELL
  end

end
