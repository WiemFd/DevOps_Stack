terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC 
resource "aws_vpc" "myVPC" {
    cidr_block = var.cidr_block[0]

    tags = {
      Name = "myVPC"
    }
}

# Create Public Subnet 
resource "aws_subnet" "MySubnet1" {
    vpc_id = aws_vpc.myVPC.id
    cidr_block = var.cidr_block[1]

    tags = {
        Name = "mySubnet1"
    } 
}

#Create Internet Gateway
resource "aws_internet_gateway" "INTGW" {
    vpc_id = aws_vpc.myVPC.id

    tags = {
        Name = "myInternetGW"
    }
  
}

#Create Security Group
resource "aws_security_group" "Sec_Group" {
    name = "My Security Group"
    description = "To allow inbound and outbound traffic"
    vpc_id = aws_vpc.myVPC.id

    #inbound traffic
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    }

    #outbound traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" #all
        cidr_blocks = ["0.0.0.0/0"] 
    }

    tags = {
      Name = "Allow traffic"
    }
  
}