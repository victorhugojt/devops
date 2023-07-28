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
### todos (no)
```sh
ssh -J bastion-vhjt ubuntu@10.1.83.211
```
### logs (no)
```sh
ssh -J bastion-vhjt ubuntu@10.1.85.10
```
## logs ec2 instances
```sh
cat /var/log/cloud-init-output.log
```


terraform destroy -target='aws_instance.host-auth'

Issues

primero: no es un error de codigo, porque con el docker-compose funciona

segundo: es un null pointer exception de toda la vida, significa que algo que esta llamando el servicio le esta devolviendo nil

tercero: la unica diferencia entre lo que estas corriendo en el docker-compose y vagrant son las variables de entorno

cuarto: la unica variable de entorno que cambia es users_api_address

quinto: la estas cambiando de http://dns:port a ip: port

sexto: ambos servicios se pueden alcanzar entre si por la ip

conclusion falta el http:// antes de la ip, sino go falla en hacer el curl por alguna razon y devuelve un token nil que el dev no verifica, lo que ocasiona el error en el servidor que viste
