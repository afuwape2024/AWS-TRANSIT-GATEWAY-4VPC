variable "detroit_vpc" {
	type = string
}

variable "detroit_vpc_cidr_block" {
	type = string
}

variable "detroit_public_subnet_cidr_block" {
	type = list(string)
}

variable "detroit_private_subnet_cidr_block" {
	type = list(string)
}

variable "detroit_database_subnet_cidr_block" {
	type = list(string)
}

variable "availability_zones" {
	type = list(string)
}
