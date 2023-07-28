data "aws_vpc" "vpc" {
  id = var.vpc_id
}

data "aws_subnet" "public_subnet" {
  id     = var.public_subnet_id
  vpc_id = data.aws_vpc.vpc.id
}

data "aws_subnet" "public_subnet_additional" {
  id     = var.public_subnet_additional_id
  vpc_id = data.aws_vpc.vpc.id
}


data "aws_subnet" "private_subnet" {
  id     = var.private_subnet_id
  vpc_id = data.aws_vpc.vpc.id
}
