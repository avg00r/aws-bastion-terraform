data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_autoscaling_group" "bastion_autoscaling_group" {
  min_size = 1
  max_size = 1
}

resource "aws_launch_configuration" "bastion_launch_config" {
  name                        = "web_config"
  image_id                    = data.aws_ami.ubuntu.id
  key_name                    = var.ssh_key       # key_name = "MyMacKey"
  instance_type               = var.instance_type #instance_type = "t2.micro"
  associate_public_ip_address = true
}
