# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Base VM OS configuration.
  config.vm.box = "ubuntu/focal64"
  #config.vm.synced_folder '.', '/vagrant', disabled: false
  config.ssh.insert_key = false

  config.vm.provider :virtualbox do |v|
    v.memory = 1024
    v.cpus = 1
  end

  # Define two VMs with static private IP addresses.
  boxes = [
    { :name => "master",
      :ip => "192.168.50.10",
    },
    { :name => "minion1",
      :ip => "192.168.50.11",
    },
    { :name => "minion2",
      :ip => "192.168.50.12",
    }
  ]
  # Provision each of the VMs.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.network "private_network", ip: opts[:ip]

      if opts[:name] == boxes.last[:name] 
        config.vm.provision "ansible" do |ansible|
          ansible.playbook = "ansible/provision.yml"
          ansible.inventory_path = "ansible/hosts"
          ansible.host_key_checking = "false"
          ansible.limit = "all"
        end
      end

    end
  end
end




