# -*- mode: ruby -*-
# vi: set ft=ruby :

required_plugins = %w( vagrant-cachier )
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  # Provider
  (1..2).each do |n|
    config.vm.define "vm0#{n}" do |srv|
        srv.vm.box ="ubuntu/trusty64"
        srv.vm.hostname = "vm0#{n}"
        srv.vm.network "private_network", ip: "10.0.0.1#{n}"
    end
  end

  # Provision 
  config.vm.provision "shell", inline: <<-SHELL
    useradd ucu
    ssh-keygen -b 1024 -f ucu -t dsa
    sudo mkdir -p /home/ucu/.ssh
    cat ucu.pub | sudo tee -a /home/ucu/.ssh/authorized_keys 
    sudo chmod 600 /home/ucu/.ssh/authorized_keys
    sudo chmod 700 /home/ucu/.ssh
    sudo chown -R ucu /home/ucu 

    cp -rf /vagrant/ssh_config /etc/ssh/ssh_config
    cp -rf /vagrant/sshd_config /etc/ssh/sshd_config

    service ssh restart
  SHELL
end

