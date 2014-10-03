# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "curious"

  config.vm.provider "virtualbox" do |v, override|
    v.gui = false
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 1]
  end

  $script = <<SCRIPT
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update -qq && sudo apt-get install -y lxc-docker
sudo usermod -a -G docker vagrant && sudo su -l vagrant

sudo mkdir -p /var/lock/curious && sudo chown -R vagrant:vagrant /var/lock/curious
SCRIPT

  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.provision "shell", inline: $script
end

