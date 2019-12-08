data "aws_ami" "amazon_linux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  owners = ["amazon"]
}

resource "aws_autoscaling_group" "bastion_autoscaling_group" {
  name                 = "Bastion-Autoscaling-Group"
  launch_configuration = aws_launch_configuration.bastion_launch_config.name
  min_size             = 1
  max_size             = 1
  desired_capacity     = 1
  vpc_zone_identifier  = [var.subnet_id]
}

resource "aws_launch_configuration" "bastion_launch_config" {
  name_prefix = "bastion-"
  //name                        = "web_config"
  image_id                    = data.aws_ami.amazon_linux.id
  key_name                    = var.ssh_key       # key_name = "MyMacKey"
  instance_type               = var.instance_type #instance_type = "t2.micro"
  associate_public_ip_address = false
  security_groups             = [aws_security_group.bastion_sg.id]
  user_data                   = <<EOF
#!/usr/bin/env bash
INSTANCE_ID=$(curl -s -m 60 http://169.254.169.254/latest/meta-data/instance-id)
aws --region ${var.region} ec2 associate-address --instance-id $INSTANCE_ID --allocation-id ${aws_eip.bastion.id} --allow-reassociation
EOF
  // test without region
  //aws --region ${aws_region.current.name} ec2 associate-address --instance-id $INSTANCE_ID --allocation-id ${aws_eip.bastion.id} --allow-reassociation
  /*
 #cloud-config
 runcmd:
   - aws ec2 associate-address --instance-id $(curl http://169.254.169.254/latest/meta-data/instance-id) --allocation-id ${aws_eip.bastion.id} --allow-reassociation
  EOF
  */
}

resource "aws_eip" "bastion" {
  vpc = true
}
