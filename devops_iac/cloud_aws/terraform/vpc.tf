resource "aws_vpc" "vpc-07623f2f9a9ec1fec" {
  cidr_block           = "192.168.0.0/24"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "vpc-07623f2f9a9ec1fec / proyecto-vpc"
  }
}


resource "aws_subnet" "subnet-07808b1015937326e" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "192.168.0.0/28"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "proyecto-subnet-public1-us-east-1a"
  }
}

resource "aws_subnet" "subnet-0b368f821d6f8a579" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = "192.168.0.128/28"
  availability_zone = "us-east-1a"
  tags = {
    Name = "proyecto-subnet-private1-us-east-1a"
  }
}
