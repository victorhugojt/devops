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
    cidr_blocks     = ["${var.public_ssh_location}"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_vpc.vpc.cidr_block}"]
  }

  tags = {
    Name = "private-ssh"
  }

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

resource "aws_security_group" "front_instance_security_group" {
  name        = var.front_instance_sg_name
  description = var.front_instance_sg_description
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = var.front_sg_ingress_description
    from_port   = var.front_port
    to_port     = var.front_port
    protocol    = var.front_sg_ingress_protocol
    cidr_blocks = var.front_sg_ingress_cird
  }
  ingress {
    description     = var.shh_sg_ingress_description
    from_port       = var.ssh_sg_ingress_port
    to_port         = var.ssh_sg_ingress_port
    protocol        = var.front_sg_ingress_protocol
    security_groups = [aws_security_group.bastion-allow-ssh.id]
  }
  egress {
    description = "Outbound rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "lb_front_security_group" {
  name        = var.front_lb_sg_name
  description = var.front_lb_sg_description
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = var.front_sg_ingress_description
    from_port   = var.front_port
    to_port     = var.front_port
    protocol    = var.front_sg_ingress_protocol
    cidr_blocks = var.front_sg_ingress_cird
  }
  egress {
    description = "Outbound rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
