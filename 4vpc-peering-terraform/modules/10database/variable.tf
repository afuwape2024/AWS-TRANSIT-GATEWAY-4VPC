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

variable "database_mysql" {
  default = "database_mysql"
}

variable "database_instance_class" {
  default = "db.t3.micro"
}

variable "database_username" {
  default = "admin"
}

variable "database_password" {
  default   = "adminadmin"
  sensitive = true
}

variable "database_security_group" {}

variable "db_subnet" {
  type = list(string)
}
