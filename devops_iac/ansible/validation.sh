ansible -m ping nodes -i hosts 2>/dev/null

ansible nodes -m ansible.builtin.setup

