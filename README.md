        These Ansible configuration assumes that you have 3 vagrantboxes that provisioned earlier.
            - See https://gitlab.com/bilalx20/vagrantboxes/tree/master/kubernetes-ansible-multi-node to provision and run vagrant up command
        After successfully builded vagrantboxes, run below command to start installation.
            - $ ansible-playbook -i /etc/ansible/hosts /etc/ansible/playbooks/kube-dependencies.yml