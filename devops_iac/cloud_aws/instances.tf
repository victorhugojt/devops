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
