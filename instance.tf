resource "aws_instance" "bastion" {

  ami = "ami-00eb20669e0990cb4"

  key_name      = var.ssh_key       # key_name = "MyMacKey"
  instance_type = var.instance_type #instance_type = "t2.micro"
  subnet_id     = var.subnet_id

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "AWS Bastion Terraform"
  }
}

/*
resource "aws_default_vpc" "default" {}
*/
