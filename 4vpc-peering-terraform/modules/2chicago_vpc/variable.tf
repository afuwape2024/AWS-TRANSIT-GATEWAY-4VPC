variable "chicago_vpc" {
	type = string
}

variable "chicago_vpc_cidr_block" {
	type = string
}

variable "chicago_public_subnet_cidr_block" {
	type = list(string)
}

variable "chicago_app_subnet_cidr_block" {
	type = list(string)
}

variable "chicago_database_subnet_cidr_block" {
	type = list(string)
}

variable "availability_zones" {
	type = list(string)
}
