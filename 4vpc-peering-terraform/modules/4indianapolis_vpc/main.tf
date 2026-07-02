
resource "aws_vpc" "indianapolis_vpc" {
  cidr_block           = var.indianapolis_vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.indianapolis_vpc
  }
}

#==================================================================
resource "aws_subnet" "indianapolis_vpc_public_subnet" {
  vpc_id                  = aws_vpc.indianapolis_vpc.id
  cidr_block              = var.indianapolis_public_subnet_cidr_block[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "indianapolis_vpc_public_subnet"
  }
}

resource "aws_subnet" "indianapolis_vpc_public2_subnet" {
  vpc_id                  = aws_vpc.indianapolis_vpc.id
  cidr_block              = var.indianapolis_public_subnet_cidr_block[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "indianapolis_vpc_public2_subnet"
  }
}

#==================================================

resource "aws_subnet" "indianapolis_vpc_private_subnet" {
  vpc_id                  = aws_vpc.indianapolis_vpc.id
  cidr_block              = var.indianapolis_app_subnet_cidr_block[0]
  availability_zone       = var.availability_zones[0]

  tags = {
    Name = "indianapolis_vpc_private_subnet"
  }
}

resource "aws_subnet" "indianapolis_vpc_private2_subnet" {
  vpc_id                  = aws_vpc.indianapolis_vpc.id
  cidr_block              = var.indianapolis_app_subnet_cidr_block[1]
  availability_zone       = var.availability_zones[1]

  tags = {
    Name = "indianapolis_vpc_private2_subnet"
  }
}

#=======================================================
resource "aws_subnet" "indianapolis_vpc_database_subnet_0" {
  vpc_id                  = aws_vpc.indianapolis_vpc.id
  cidr_block              = var.indianapolis_database_subnet_cidr_block[0]
  availability_zone       = var.availability_zones[0]

  tags = {
    Name = "indianapolis_vpc_database_subnet_0"
  }
}

resource "aws_subnet" "indianapolis_vpc_database_subnet_1" {
  vpc_id                  = aws_vpc.indianapolis_vpc.id
  cidr_block              = var.indianapolis_database_subnet_cidr_block[1]
  availability_zone       = var.availability_zones[1]

  tags = {
    Name = "indianapolis_vpc_database_subnet_1"
  }
}