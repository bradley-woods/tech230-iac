# Main
# ----
# Using Terraform to launch following resources as two-tier architecture in Ireland (eu-west-1)
# 1. Virtual Private Cloud (VPC)
# 2. Internet Gateway (IGW)
# 3. Public Subnet
# 4. Private Subnet
# 5. Public Subnet Route Table
# 6. Public Subnet Route Table Association
# 7. Public Subnet Security Group
# 8. Private Subnet Security Group
# 9. App EC2 Instance
# 10. Database EC2 Instance

# Configure AWS as cloud provider
provider "aws" {
	region = var.region
}

# Deploy Virtual Private Cloud (VPC)
resource "aws_vpc" "vpc" {
	cidr_block       = var.vpc_cidr
	instance_tenancy = "default"

	tags = {
		Name = var.vpc_name
	}
}

# Deploy Internet Gateway and attach to VPC
resource "aws_internet_gateway" "ig" {
	vpc_id = aws_vpc.vpc.id

	tags = {
		Name = var.ig_name
	}
}

# Deploy Public Subnet
resource "aws_subnet" "public_subnet" {
	vpc_id                  = aws_vpc.vpc.id
	cidr_block              = var.public_subnet_cidr
	availability_zone       = var.az
	map_public_ip_on_launch = true

	tags = {
		Name = var.public_subnet_name
	}
}

# Deploy Private Subnet
resource "aws_subnet" "private_subnet" {
	vpc_id                  = aws_vpc.vpc.id
	cidr_block              = var.private_subnet_cidr
	availability_zone       = var.az
	map_public_ip_on_launch = false

	tags = {
		Name = var.private_subnet_name
	}
}

# Deploy Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
	vpc_id = aws_vpc.vpc.id

	route {
		cidr_block = var.open_cidr
		gateway_id = aws_internet_gateway.ig.id
	}
	tags = {
		Name = var.route_table_name
	}
}

# Private Subnet will be routed private by default

# Associate Public Subnet With Route Table
resource "aws_route_table_association" "public_route" {
	subnet_id      = aws_subnet.public_subnet.id
	route_table_id = aws_route_table.public_rt.id
}

# Deploy Public Subnet Security Group
resource "aws_security_group" "public_subnet_sg" {
	name        = "public_subnet_sg"
	description = "Allow Port 80 (HTTP), 22 (SSH) and 3000 (NodeJS)"
	vpc_id      = aws_vpc.vpc.id

	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = var.open_cidr_sg
	}
	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = var.open_cidr_sg
	}
	ingress {
		from_port   = 3000
		to_port     = 3000
		protocol    = "tcp"
		cidr_blocks = var.vpc_cidr_sg
	}
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = var.open_cidr_sg
	}
}

# Deploy Private Subnet Security Group
resource "aws_security_group" "private_subnet_sg" {
	name        = "private_subnet_sg"
	description = "Allow Port 27017 (MongoDB)"
	vpc_id      = aws_vpc.vpc.id

	ingress {
		from_port   = 27017
		to_port     = 27017
		protocol    = "tcp"
		cidr_blocks = var.vpc_cidr_sg
	}
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = var.open_cidr_sg
	}
}

# Deploy EC2 Instance for Web Application in Public Subnet
resource "aws_instance" "app_instance" {
	ami                         = var.app_ami
	instance_type               = "t2.micro"
	key_name                    = "tech230"
	availability_zone           = var.az
	vpc_security_group_ids      = [aws_security_group.public_subnet_sg.id]
	subnet_id                   = aws_subnet.public_subnet.id
	associate_public_ip_address = true
	user_data                   = "${file("provision-app.sh")}"
	tags = {
		Name = var.app_instance_name
	}
}

# Deploy EC2 Instance for Database in Private Subnet
resource "aws_instance" "db_instance" {
	ami                         = var.db_ami
	instance_type               = "t2.micro"
	key_name                    = "tech230"
	availability_zone           = var.az
	vpc_security_group_ids      = [aws_security_group.private_subnet_sg.id]
	subnet_id                   = aws_subnet.private_subnet.id
	associate_public_ip_address = false
	private_ip                  = var.db_private_ip
	#user_data                   = "${file("provision-db.sh")}"
	tags = {
		Name = var.db_instance_name
	}
}
