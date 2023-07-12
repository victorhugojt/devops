data "aws_ami" "ubuntu-linux-2004" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.ubuntu-linux-2004.id
  instance_type          = var.EC2_TYPE
  subnet_id              = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.bastion-allow-ssh.id]
  key_name               = aws_key_pair.vhjt_key.key_name

  volume_tags = {
    project     = var.project
    responsible = var.responsible
  }

  tags = {
    Name = "bastion-vhjt"
  }

}

resource "aws_instance" "users_host" {
  ami                    = data.aws_ami.ubuntu-linux-2004.id
  instance_type          = var.EC2_TYPE
  subnet_id              = data.aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.private-ssh.id]
  key_name               = aws_key_pair.vhjt_key.key_name

  user_data = base64encode(templatefile(var.common_start_sh_path, {
    run = "sudo docker run -p 8083:8083 --restart=always -d -e JWT_SECRET=${var.jwt} SERVER_PORT=8083 victoremilio/devops_rampup_users:1.0"
  }))

  volume_tags = {
    project     = var.project
    responsible = var.responsible
  }

  tags = {
    Name = "users_host"
  }

}

resource "aws_instance" "host-auth" {
  ami                    = data.aws_ami.ubuntu-linux-2004.id
  instance_type          = var.EC2_TYPE
  subnet_id              = data.aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.private-ssh.id]
  key_name               = aws_key_pair.vhjt_key.key_name

  user_data = base64encode(templatefile(var.common_start_sh_path, {
    run = "docker run -p 8000:8000 --restart=always -d -e JWT_SECRET=${var.jwt} -e AUTH_API_PORT=8000 -e USERS_API_ADDRESS=${aws_instance.users_host.private_ip} victoremilio/devops_rampup_auth:1.0"
  }))

  volume_tags = {
    project     = var.project
    responsible = var.responsible
  }

  tags = {
    Name = "host-auth"
  }

}

output "bastion_ip_addr" {
  value = aws_instance.bastion.public_ip
}

output "host_ip_addr" {
  value = aws_instance.host-auth.private_ip
}

output "common-script" {
  value = templatefile(var.common_start_sh_path, {
    run = "docker run -p 8000:8000 --restart=always -d -e JWT_SECRET=${var.jwt} -e AUTH_API_PORT=8000 -e USERS_API_ADDRESS=${aws_instance.users_host.private_ip} victoremilio/devops_rampup_auth:1.0"
  })
}