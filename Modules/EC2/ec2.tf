#-----------------------------------------------------------#
#     Astrovidhi Prod EC2  - http:prod-api.mypropertyqr.in
#-----------------------------------------------------------#

#Create a new Astrovidhi prod API -1 EC2 launch configuration..

resource "aws_instance" "prod-api-1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.prod-api_key_name
  vpc_security_group_ids = [var.security_group_id]
  subnet_id     = var.public-subnet-1_id
  associate_public_ip_address = true
  disable_api_termination = true
  
  tags = {
Name = "prod-api.mypropertyqr.in"
}

root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    volume_size           = "20"
    volume_type           = "gp3"
  }

lifecycle {
    create_before_destroy = true
  }
}


#Create a new EIP for astrovidhi prod EC2..

resource "aws_eip" "prod-eip-1" {
  instance = aws_instance.prod-api-1.id
  vpc = true
 
tags = {
    Name = "prod-api.mypropertyqr.in"
  }
}
