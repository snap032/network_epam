Vagrant.configure("2") do |config|
  
  config.vm.define "R13" do |r13|
    r13.vm.box = "ubuntu/xenial64"
    r13.vm.hostname = "R13"
    r13.vm.provision "shell", inline: <<-SHELL
    sudo tee -a /etc/network/interfaces << EOF
auto enp0s8
iface enp0s8 inet dhcp
EOF
  SHELL
  end

  config.vm.define "r23" do |r23|
    r23.vm.box = "ubuntu/xenial64"
    r23.vm.hostname = "R23"
    r23.vm.provision "shell", inline: <<-SHELL
    sudo tee -a /etc/network/interfaces << EOF
auto enp0s8
iface enp0s8 inet dhcp
EOF
  SHELL
  end


  config.vm.define "nat" do |nat|
    nat.vm.box = "ubuntu/xenial64"
    nat.vm.hostname = "nat"
    nat.vm.provision "shell", path: "script.sh"
    nat.vm.provision "shell", path: "bind.sh"

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
    nginx2.vm.provision "shell", inline: <<-SHELL
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
end
