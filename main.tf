#----------------------------------------------------------
# My Terraform
#
# Build High Availability Bastion Server
#
# Made by Vadim Yangunaev
#----------------------------------------------------------
provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 0.12"
}

//data "aws_region" "current" {}
