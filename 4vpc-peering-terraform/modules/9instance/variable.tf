variable "image_id" {
  description = "The AMI ID for the EC2 instance"
}
variable "instance_type" {  
  description = "The instance type for the EC2 instance"
}
variable "detroit_public_sg_id" {
  description = "The security group ID for the Detroit web server"
}

variable "detroit_app_sg_id" {
  description = "The security group ID for the Detroit app server"
}

variable "detroit_db_sg_id" {
  description = "The security group ID for the Detroit database server"
}

variable "detroit_vpc" {}
variable "detroit_vpc_public_subnet" {}
variable "detroit_vpc_web2_subnet" {}
variable "detroit_vpc_app_subnet" {}
variable "detroit_vpc_app2_subnet" {}
variable "detroit_vpc_igw" {}

variable "chicago_vpc" {}
variable "chicago_vpc_public_subnet" {}
variable "chicago_vpc_app_subnet" {}
variable "chicago_vpc_web2_subnet" {}
variable "chicago_vpc_app2_subnet" {}
variable "chicago_vpc_igw" {}

variable "columbus_vpc" {}
variable "columbus_vpc_public_subnet" {}
variable "columbus_vpc_app_subnet" {}
variable "columbus_vpc_web2_subnet" {}
variable "columbus_vpc_app2_subnet" {}
variable "columbus_vpc_igw" {}

variable "indianapolis_vpc" {}
variable "indianapolis_vpc_public_subnet" {}
variable "indianapolis_vpc_app_subnet" {}
variable "indianapolis_vpc_web2_subnet" {}
variable "indianapolis_vpc_app2_subnet" {}
variable "indianapolis_vpc_igw" {}