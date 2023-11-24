ansible -m ping nodes -i hosts 2>/dev/null

ansible nodes -m ansible.builtin.setup

ansible-playbook -i hosts ~/training/devops/devops_iac/ansible/playbooks/first-playbook.yaml -u ubuntu

