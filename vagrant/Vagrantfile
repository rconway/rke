# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.base_mac = nil

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = "2"
    vb.linked_clone = true
  end

  config.vm.define "rke01" do |node|
    node.vm.hostname = "rke01"
    node.vm.network "private_network", ip: "192.168.123.101"
    node.vm.provider "virtualbox" do |vb|
      vb.name = "rke01"
    end
  end

  config.vm.define "rke02" do |node|
    node.vm.hostname = "rke02"
    node.vm.network "private_network", ip: "192.168.123.102"
    node.vm.provider "virtualbox" do |vb|
      vb.name = "rke02"
    end
  end

  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"

  config.vm.provision "shell", name: "rke-setup", path: "rke-node-setup.sh"

  config.vm.provision "shell", inline: <<-EOT
    cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
    EOT

end
