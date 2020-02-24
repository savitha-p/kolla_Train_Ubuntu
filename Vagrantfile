# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
     config.vm.define "compute" do |compute|
     compute.vm.provider :libvirt do |compute|
        compute.machine_virtual_size = 100
        compute.cpus = 4
        compute.cputopology :sockets => '2', :cores => '2', :threads => '1'
        compute.memory = 8140
    end

    compute.vm.box = "generic/ubuntu1804"
    compute.vm.hostname = "compute"
    compute.vm.network "public_network", :type => "bridge", :dev => "br0", :ip => "172.172.3.61", :netmask => "255.255.255.0", :gateway => "172.172.3.1"
    compute.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.54", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
    compute.vm.network "public_network", :type => "bridge", :dev => "br0", auto_config: true, use_dhcp_assigned_default_route: true
    compute.vm.provision "shell",run: "always",inline: "route add default gw 172.172.3.1 dev eth1"
    compute.vm.provision :shell, :path => "epel.sh"
    compute.vm.provision :shell, :path => "enable-root-login.sh"
    compute.vm.provision :shell, :path => "computedep.sh"
    end
    
    config.vm.define "controller" do |controller|
    controller.vm.provider :libvirt do |libvirt|
        libvirt.machine_virtual_size = 100
        libvirt.cpus = 8
        libvirt.storage :file, :size => '40G', :device => 'vdb', :type => 'raw'
        libvirt.cputopology :sockets => '4', :cores => '2', :threads => '1'
        libvirt.memory = 12240
    end

    controller.vm.box = "generic/ubuntu1804"
    controller.vm.hostname = "controller"
    controller.vm.network "public_network", :type => "bridge", :dev => "br0", :ip => "172.172.3.62", :netmask => "255.255.255.0", :gateway => "172.172.3.1"
    controller.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.55", :netmask => "255.255.255.0",:gateway => "10.10.10.1"
    controller.vm.network "public_network", :type => "bridge", :dev => "br0", auto_config: true, use_dhcp_assigned_default_route: true
    controller.vm.provision "shell",run: "always",inline: "route add default gw 172.172.3.1 dev eth1"
    controller.vm.provision :shell, :path => "epel.sh"
    controller.vm.provision :shell, :path => "enable-root-login.sh"
    controller.vm.provision :shell, :path => "sshpass"
    controller.vm.provision :shell, :path => "dependecy.sh"
    controller.vm.provision :shell, :path => "docker.sh"
    controller.vm.provision :shell, :path => "Kolla-ansible.sh"
    #controller.vm.synced_folder "/mnt/build-vault/file-manager", "/opt/file-manager"
    controller.vm.synced_folder "/mnt/build-vault/file-manager", "/opt/file-manager",type: "rsync"
    controller.vm.provision :shell, :path => "createresources.sh"
    controller.vm.provision :shell, :path => "policy.sh"
    end

end

