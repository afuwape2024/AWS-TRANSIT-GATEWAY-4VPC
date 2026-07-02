variable "indianapolis_vpc" {
  type = string
}

variable "indianapolis_vpc_cidr_block" {
  type = string
}

variable "indianapolis_public_subnet_cidr_block" {
  type = list(string)
}

variable "indianapolis_app_subnet_cidr_block" {
  type = list(string)
}

variable "indianapolis_database_subnet_cidr_block" {
  type = list(string)
}

variable "availability_zones" {
	type = list(string)
}
