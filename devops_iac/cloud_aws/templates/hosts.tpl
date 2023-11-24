[proxy]
${ip}

[nodes]
%{ for ip in nodes ~}
${ip}
%{ endfor ~}

[nodes:vars]
ansible_port = 22
ansible_user = ubuntu
ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -q ubuntu@18.144.19.207"'