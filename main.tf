# To create a service on AWS cloud
# --------------------------------
# launch an EC2 instance in Ireland (eu-west-1)
# Terraform to download required dependencies
# terraform init

provider "aws" {
# which region of AWS
	region = region
	
}
# Git bash must have admin access
# launch an EC2 instance

# which resource
resource "aws_instance" "app_instance" {

# which AMI - ubuntu 18.04
	ami = ami

# type of instance - t2.micro
	instance_type = type

# do you need public ip - yes
	associate_public_ip_address = true

# what would you like to call it
	tags = {
		Name = name
		
	}
}
