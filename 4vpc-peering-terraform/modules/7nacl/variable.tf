variable "outside_cidr_block" {
  type        = string
  description = "CIDR block used for public ingress/egress defaults"
}

variable "public_nacl" {
  type = map(any)
  description = "Web NACL rules configuration"
}

variable "app_nacls" {
  type = map(any)
  description = "App/private NACL rules per city"
}

variable "database_nacls" {
  type = map(any)
  description = "Database NACL rules configuration"
}

variable "database_ports" {
  type = map(any)
  description = "Database port definitions"
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