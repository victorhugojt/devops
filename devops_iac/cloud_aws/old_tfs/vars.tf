variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMI" {
  type = map(string)

  default = {
    eu-east-1 = "ami-0715c1897453cabd1" # Amazon Linux 2023 AMI 2023.0.20230517.1 x86_64 HVM kernel-6.1
  }
}
variable "EC2_USER" {
  default = "ubuntu"
}

variable "EC2_TYPE" {
  type        = string
  description = "EC2 instance type for Linux Server"
  default     = "t2.micro"
}

