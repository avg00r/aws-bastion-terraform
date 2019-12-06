#----------------------------------------------------------
# My Terraform
#
# Build High Availability Bastion Server
#
# Made by Vadim Yangunaev
#----------------------------------------------------------
provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 0.12"
}
