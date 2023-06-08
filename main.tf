# To create a service on AWS cloud
# --------------------------------
# launch an EC2 instance in Ireland (eu-west-1)
# Terraform to download required dependencies
# terraform init

provider "aws" {
# which region of AWS
	region = "eu-west-1"
	
}
# Git bash must have admin access
# launch an EC2 instance

# which resource
resource "aws_instance" "app_instance" {

# which AMI - ubuntu 18.04
	ami = "ami-00e8ddf087865b27f"

# type of instance - t2.micro
	instance_type = "t2.micro"

# do you need public ip - yes
	associate_public_ip_address = true

# what would you like to call it
	tags = {
		Name = "tech230-bradley-terraform-app"
		
	}
}
