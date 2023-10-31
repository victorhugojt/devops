terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.AWS_REGION

  default_tags {
    tags = {
      project     = var.project
      responsible = var.responsible
    }
  }

}

resource "localfile" "host_config" {
  content = templatefile("inventory.tmpl", {
    aws_hosts = "XXXX"
  })
  filename = "./inventory"
}
