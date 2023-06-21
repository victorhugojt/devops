variable "AWS_REGION" {
  default = "us-east-1"
}

variable "EC2_USER" {
  default = "ubuntu"
}

variable "EC2_TYPE" {
  type        = string
  description = "EC2 instance type for Linux Server"
  default     = "t2.micro"
}

variable "vpc_id" {
  type        = string
  description = "Devops Rampup VPC"
  default     = "vpc-07623f2f9a9ec1fec"
}

variable "public_subnet_id" {
  type        = string
  description = "Private Subnet"
  default     = "subnet-07808b1015937326e"
}

variable "private_subnet_id" {
  type        = string
  description = "Public Subnet"
  default     = "subnet-0b368f821d6f8a579"
}
