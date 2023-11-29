ansible -m ping nodes -i hosts 2>/dev/null

ansible nodes -m ansible.builtin.setup

ansible-playbook -i hosts ~/training/devops/devops_iac/ansible/playbooks/first-playbook.yaml -u ubuntu

ansible-playbook -i hosts ~/training/devops/devops_iac/ansible/playbooks/auth.yaml -u ubuntu

ansible-playbook -i hosts ~/training/devops/devops_iac/ansible/playbooks/redis.yaml -u ubuntu

ansible-playbook -i hosts ~/training/devops/devops_iac/ansible/playbooks/log_processor.yaml -u ubuntu

ansible-playbook -i hosts ~/training/devops/devops_iac/ansible/playbooks/todos.yaml -u ubuntu

ansible-playbook -i hosts ~/training/devops/devops_iac/ansible/playbooks/fe-playbook.yaml -u ubuntu


aws ec2 describe-instances \
--filters Name=tag:aws:autoscaling:groupName,Values=frontend_host_auto_scaling_group \
--query 'Reservations[*].Instances[*].{"private_ip":PrivateIpAddress}' \
--output json