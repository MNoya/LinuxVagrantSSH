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
    mkdir -p /home/ucu/.ssh
    cp /vagrant/id_rsa /home/ucu/.ssh/id_rsa
    cp /vagrant/id_rsa.pub /home/ucu/.ssh/id_rsa.pub
    cp /vagrant/id_rsa.pub /home/ucu/.ssh/authorized_keys  
    chmod 600 /home/ubuntu/.ssh/authorized_keys
    chmod 600 /home/ucu/.ssh/id_rsa
    chmod 600 /home/ucu/.ssh/id_rsa.pub
    chmod 700 /home/ucu/.ssh
    chown -R ucu /home/ucu 
    cp /vagrant/ssh_config /etc/ssh/ssh_config
    cp /vagrant/sshd_config /etc/ssh/sshd_config
    service ssh restart
  SHELL
end

