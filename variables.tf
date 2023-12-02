# Set cidr_block variables for VPC and Subnet 
variable "cidr_block" {
    type = list(string)
    default = [ "172.20.0.0/16","172.20.10.0/24"]
}

# Set ports
variable "ports" {
    type = list(number)
    default = [ 22,80,443,8080,8081 ]
}

# Set ami 
variable "ami" {
    type = string
    default = "ami-0e8a34246278c21e4"
}

# Set instance type 
variable "instance_type" {
    type = string
    default = "t2.micro"
}

# Set instance type for Nexus
variable "instance_type_for_Nexus" {
    type = string 
    default = "t2.medium"
}