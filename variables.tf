# Each input variable accepted by a module must be declared using a variable block:

variable "ssh_key" {
  description = "The key name of the Key Pair to use for the instance:"
  //  default     = "MyMacKey"
}

variable "instance_type" {
  description = "The type of instance to start:"
  //  default     = "t2.micro"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID:"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID:"
}
