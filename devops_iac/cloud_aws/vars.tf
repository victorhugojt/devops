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
