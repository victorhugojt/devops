variable "AWS_REGION" {
  default = "us-west-1"
}

variable "EC2_USER" {
  default = "ubuntu"
}

variable "CONNECTION_PROTOCOL" {
  default = "ssh"
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
  description = "Public Subnet"
  default     = "subnet-0088df5de3a4fe490"
}

variable "public_subnet_additional_id" {
  type        = string
  description = "Public Subnet Number 1"
  default     = "subnet-055c41fce697f9cca"
}


variable "private_subnet_id" {
  type        = string
  description = "Private Subnet"
  default     = "subnet-0d74b59773148d704"
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

variable "private_key_path" {
  type        = string
  description = "private key for ssh"
  default     = "~/.ssh/id_rsa"
}

variable "public_key_path" {
  type        = string
  description = "public key for ssh"
  default     = "~/.ssh/id_rsa.pub"
}

variable "common_start_sh_path" {
  type        = string
  description = "path to common installers script"
  default     = "~/training/devops/devops_iac/cloud_aws/start-up/common.sh"
}

variable "jwt" {
  type        = string
  description = "jwt token"
  default     = "PRFT"
}

variable "redis_port" {
  type        = string
  description = "redis port"
  default     = "6379"
}

variable "redis_log_channel" {
  type    = string
  default = "log_channel"
}

variable "public_ssh_location" {
  type        = string
  description = "Public IP Address"
  default     = "179.15.15.40/32"
}

variable "tg_target_type" {
  type    = string
  default = "instance"
}

variable "tg_protocol" {
  type    = string
  default = "HTTP"
}

variable "front_port" {
  type        = number
  default     = 8080
  description = "This is the port for the inbound rule that allowed front to the ec2 instance"
}

variable "front_lb_sg_name" {
  default = "front_lb_security_group"
}

variable "front_lb_sg_description" {
  default = "Security group for movies front load balancer"
}

variable "front_instance_sg_name" {
  default = "front_intance_security_group"
}

variable "front_instance_sg_description" {
  default = "Security group for front instance"
}

variable "front_sg_ingress_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed front to the ec2 instance"
}

variable "front_sg_ingress_description" {
  type    = string
  default = "Allowed front from anywhere"
}

variable "front_sg_ingress_cird" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "This is the list of CIDR"
}

variable "ssh_sg_ingress_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed shh to the ec2 instance"
}

variable "shh_sg_ingress_description" {
  type    = string
  default = "Allowed db from my public ip and inner ips"
}

variable "ssh_sg_ingress_port" {
  type        = number
  default     = 22
  description = "This is the port for the inbound rule that allowed ssh to the ec2 instance"
}

variable "ami_id" {
  type        = string
  default     = "ami-0d382e80be7ffdae5"
  description = "Ubuntu 20.04"
}

variable "lb_type" {
  default = "application"
}

variable "front_lb_name" {
  default = "FrontAppLoadBalancer"
}
