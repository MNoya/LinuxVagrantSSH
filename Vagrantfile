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
        srv.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    end
  end

  # Provision 
  config.vm.provision "shell", inline: <<-SHELL
    echo "Vagrant provision at $(date +%F-%H.%M.%S)" > /tmp/created
  SHELL

end

