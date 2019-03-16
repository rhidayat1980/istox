
variable "aws_region" {
    description = "AWS Region"
	 default = "ap-southeast-1"
}
variable "vpc_cidr_block" {
    description = "10.0.0.0/16"
}

variable "availability_zones" {
   type = "list"
   description = "AWS Region Availability Zones"
	default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]

}
variable "public_subnet_cidr_block" {
   type = "list"
   description = "Public Subnet CIDR Block"
	default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr_block" {
   type = "list"
   description = "Private Subnet CIDR Block"
	default = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}

variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-4fffc834"
}

variable "bastion_host_public_key" {
   description = "Bastion host public key"
	default = "~/.ssh/bastion_host_keypair.pub"
}

variable "instance_type" {
  default = "t2.nano"
}
