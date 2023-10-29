# Set cidr_block variables for VPC and Subnet 
variable "cidr_block" {
    type = list(string)
    default = [ "172.20.0.0/16","172.20.10.0/24"]
}

#Set ports
variable "ports" {
    type = list(number)
    default = [ 22,80,443,8080,8081 ]
}