variable "AWS_REGION" {
  default = "us-west-1"
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
  default     = "vpc-0d2831659ef89870c"
}

variable "public_subnet_id" {
  type        = string
  description = "Private Subnet"
  default     = "subnet-0088df5de3a4fe490"
}

variable "private_subnet_id" {
  type        = string
  description = "Public Subnet"
  default     = "subnet-0088df5de3a4fe490"
}

variable "project" {
  type        = string
  description = "project in aws"
  default     = "ramp-up-devops"
}

variable "responsible" {
  type        = string
  description = "user in aws"
  default     = "victor.jimenezt"
}
