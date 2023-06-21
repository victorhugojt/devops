
data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_subnet" "public_subnet" {
  id     = var.public_subnet_id
  vpc_id = data.aws_vpc.vpc.id
}

data "aws_subnet" "private_subnet" {
  id     = var.private_subnet_id
  vpc_id = data.aws_vpc.vpc.id
}

resource "aws_security_group" "bastion-allow-ssh" {
  vpc_id      = data.aws_vpc.vpc.id
  name        = "bastion-allow-ssh"
  description = "security group for bastion that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "bastion-allow-ssh"
  }
}

resource "aws_security_group" "private-ssh" {
  vpc_id      = data.aws_vpc.vpc.id
  name        = "private-ssh"
  description = "security group for private that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion-allow-ssh.id]
  }
  tags = {
    Name = "private-ssh"
  }
}
