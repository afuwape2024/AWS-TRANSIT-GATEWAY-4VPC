variable "detroit_public_sg_id" {}
variable "chicago_public_sg_id" {}
variable "columbus_public_sg_id" {}
variable "indianapolis_public_sg_id" {}

variable "detroit_target_group_arn" {
  type = string
}

variable "chicago_target_group_arn" {
  type = string
}

variable "columbus_target_group_arn" {
  type = string
}

variable "indianapolis_target_group_arn" {
  type = string
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "min_size" {
  default = 1
}

variable "max_size" {
  default = 3
}

variable "desired_capacity" {
  default = 1
}
variable "detroit_public_template" {
  default = "web-launch-template"
}

variable "detroit_vpc" {}
variable "outside_cidr_block" {}
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