# devops
Devops RampUP 2023

# virtual environment

```sh
pip install virtualenv
```

```sh
virtualenv venv_devops
```

```sh
source venv_devops/bin/activate
```

# cli usage via custom cli

```sh
devops_iac local provisioning -a up
devops_iac local provisioning -a destroy
```

# manual provissioning
```sh
grep config.vm.define Vagrantfile | awk -F'"' '{print $2}' | xargs -P4 -I {} vagrant up {}
```

# AWS Terraform

# Connections
### redis
```sh
ssh -J bastion-vhjt ubuntu@10.1.87.191
```

### front
```sh
ssh -J bastion-vhjt ubuntu@10.1.3.250
```

### users
```sh
ssh -J bastion-vhjt ubuntu@10.1.86.187
```

### auth
```sh
ssh -J bastion-vhjt ubuntu@10.1.83.16
```
### todos
```sh
ssh -J bastion-vhjt ubuntu@10.1.81.171
```
### logs
```sh
ssh -J bastion-vhjt ubuntu@10.1.87.202
```
## logs ec2 instances
```sh
cat /var/log/cloud-init-output.log
```


## Destroy specific resource
```sh
terraform destroy -target='aws_instance.todos_host'
```
