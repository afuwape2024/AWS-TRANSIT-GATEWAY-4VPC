variable "outside_cidr_block" {}

variable "detroit_vpc" {}
variable "detroit_vpc_public_subnet" {}
variable "detroit_vpc_private_subnet" {}
variable "detroit_vpc_public2_subnet" {}
variable "detroit_vpc_private2_subnet" {}
variable "detroit_vpc_database_subnet_0" {}
variable "detroit_vpc_igw" {}

variable "chicago_vpc" {}
variable "chicago_vpc_public_subnet" {}
variable "chicago_vpc_private_subnet" {}
variable "chicago_vpc_public2_subnet" {}
variable "chicago_vpc_private2_subnet" {}
variable "chicago_vpc_database_subnet_0" {}
variable "chicago_vpc_igw" {}

variable "columbus_vpc" {}
variable "columbus_vpc_public_subnet" {}
variable "columbus_vpc_private_subnet" {}
variable "columbus_vpc_public2_subnet" {}
variable "columbus_vpc_private2_subnet" {}
variable "columbus_vpc_database_subnet_0" {}
variable "columbus_vpc_igw" {}

variable "indianapolis_vpc" {}
variable "indianapolis_vpc_public_subnet" {}
variable "indianapolis_vpc_private_subnet" {}
variable "indianapolis_vpc_public2_subnet" {}
variable "indianapolis_vpc_private2_subnet" {}
variable "indianapolis_vpc_database_subnet_0" {}
variable "indianapolis_vpc_igw" {}


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

variable "key_pair_name" {
  description = "Existing EC2 key pair name to attach to instances"
  type        = string
  default     = null
}
