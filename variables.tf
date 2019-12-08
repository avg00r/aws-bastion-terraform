# Each input variable accepted by a module must be declared using a variable block:

variable "ssh_key" {
  description = "The key name of the Key Pair to use for the instance:"
  //  default     = "MyMacKey"
  default = "vadim-windows-NVirginia"
}

variable "instance_type" {
  description = "The type of instance to start:"
  default     = "t2.micro"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID:"
  default     = "vpc-2172235b"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID:"
  default     = "subnet-7374a13e"
}

variable "region" {
  type        = string
  description = "AWS region in which the Bastion should be deployed"
  default     = "us-east-1"
}
