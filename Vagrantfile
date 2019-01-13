Vagrant.require_version ">= 1.6.0"

boxes = [
    {
        :name => "kubemaster01",
        :eth1 => "172.28.128.3",
        :mem => "1500",
        :cpu => "1"
    },
    {
        :name => "kubenode01",
        :eth1 => "172.28.128.4",
        :mem => "1024",
        :cpu => "1"
    },
    {
        :name => "kubenode02",
        :eth1 => "172.28.128.5",
        :mem => "1024",
        :cpu => "1"
    }
]


Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  #config.vm.box = "ubuntu/trusty64"
  config.ssh.insert_key = false
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.provider "vmware_fusion" do |v|
        v.vmx["memsize"] = opts[:mem]
        v.vmx["numvcpus"] = opts[:cpu]
      end
      config.ssh.forward_agent = true
      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
      end
      config.vm.network :private_network, ip: opts[:eth1]
    end
  end
  config.vm.provision "ansible" do |ansible|
    ansible.config_file = "provisioning/ansible.cfg"
    ansible.inventory_path = "provisioning/hosts.ini"
    ansible.playbook = "provisioning/playbooks/run_all.yml"
  end
end

