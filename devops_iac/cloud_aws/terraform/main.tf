terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "host-ngnix" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  provisioner "file" {
    source      = "devops_iac/startup/ngnix/docker-compose.yaml"
    destination = "./docker-compose.yaml"
  }

  provisioner "file" {
    source      = "devops_iac/startup/ngnix/nginx.sh"
    destination = "./nginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sh nginx.sh",
    ]
  }

  tags = {
    Name = "private_network"
  }
}

resource "aws_instance" "host-redis" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  provisioner "file" {
    source      = "devops_iac/startup/redis/redis.sh"
    destination = "./redis.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sh redis.sh",
    ]
  }

  tags = {
    Name = "private_network"
  }
}

resource "aws_instance" "host-auth" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  provisioner "file" {
    source      = "devops_iac/startup/auth-api/env.list"
    destination = "./env.list"
  }

  provisioner "file" {
    source      = "devops_iac/startup/auth-api/auth.sh"
    destination = "./auth.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sh auth.sh",
    ]
  }

  tags = {
    Name = "private_network"
  }
}

resource "aws_instance" "host-todo" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  provisioner "file" {
    source      = "devops_iac/startup/todos-api/env.list"
    destination = "./env.list"
  }

  provisioner "file" {
    source      = "devops_iac/startup/todos-api/todos.sh"
    destination = "./todos.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sh todos.sh",
    ]
  }

  tags = {
    Name = "private_network"
  }
}

resource "aws_instance" "host-users" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  provisioner "file" {
    source      = "devops_iac/startup/users-api/env.list"
    destination = "./env.list"
  }

  provisioner "file" {
    source      = "devops_iac/startup/users-api/users.sh"
    destination = "./users.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sh users.sh",
    ]
  }

  tags = {
    Name = "private_network"
  }
}
