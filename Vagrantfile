Vagrant.require_version ">= 1.6.0"

# number of worker nodes to loop
N = 2


Vagrant.configure("2") do |config|
  # create master node first
  config.vm.define "kubemaster01" do |machine|
    machine.vm.box = "centos/7"
    # machine.vm.box = "ubuntu/trusty64"
    machine.ssh.insert_key = false
    machine.vm.hostname = "kubemaster01"
    machine.vm.network "private_network", ip: "10.0.15.10"
    machine.ssh.forward_agent = true
    machine.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "1500"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end

  # create worker nodes and start provisioning after creating last worker node
  (1..N).each do |machine_id|
    config.vm.define "kubenode0#{machine_id}" do |machine|
      machine.vm.box = "centos/7"
      # machine.vm.box = "ubuntu/trusty64"
      machine.ssh.insert_key = false
      machine.vm.hostname = "kubenode0#{machine_id}"
      machine.vm.network "private_network", ip: "10.0.15.#{20+machine_id}"
      machine.ssh.forward_agent = true
      machine.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "1024"]
        v.customize ["modifyvm", :id, "--cpus", "1"]
      end
      if machine_id == N
        machine.vm.provision :ansible do |ansible|
          # Disable default limit to connect to all the machines
          ansible.limit = "all"
          ansible.config_file = "provisioning/ansible.cfg"
          ansible.inventory_path = "provisioning/inventory/hosts.ini"
          ansible.playbook = "provisioning/playbooks/main.yml"
        end
      end
    end
  end
end
