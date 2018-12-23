        These Ansible configuration assumes that you have 3 vagrantboxes that provisioned earlier.
            - See https://github.com/bilalcaliskan/vagrantboxes/tree/master/kubernetes-ansible-multi-node to provision and run vagrant up command
        These repository also assumes that you have cloned that repository and extracted to /etc/kubernetes-ansible path
        After successfully builded vagrantboxes and extracted repository to /etc/kubernetes-ansible, run below command to start installation.
            - $ cd /etc/kubernetes-ansible && ansible-playbook -i hosts tasks/kube_dependencies.yml
