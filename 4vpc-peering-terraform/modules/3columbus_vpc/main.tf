
resource "aws_vpc" "columbus_vpc" {
  cidr_block           = var.columbus_vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.columbus_vpc
  }
}

#==================================================================
resource "aws_subnet" "columbus_vpc_public_subnet" {
  vpc_id                  = aws_vpc.columbus_vpc.id
  cidr_block              = var.columbus_public_subnet_cidr_block[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "columbus_vpc_public_subnet"
  }
}

resource "aws_subnet" "columbus_vpc_public2_subnet" {
  vpc_id                  = aws_vpc.columbus_vpc.id
  cidr_block              = var.columbus_public_subnet_cidr_block[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "columbus_vpc_public2_subnet"
  }
}

#==================================================

resource "aws_subnet" "columbus_vpc_private_subnet" {
  vpc_id                  = aws_vpc.columbus_vpc.id
  cidr_block              = var.columbus_app_subnet_cidr_block[0]
  availability_zone       = var.availability_zones[0]

  tags = {
    Name = "columbus_vpc_private_subnet"
  }
}

resource "aws_subnet" "columbus_vpc_private2_subnet" {
  vpc_id                  = aws_vpc.columbus_vpc.id
  cidr_block              = var.columbus_app_subnet_cidr_block[1]
  availability_zone       = var.availability_zones[1]

  tags = {
    Name = "columbus_vpc_private2_subnet"
  }
}

#=======================================================
resource "aws_subnet" "columbus_vpc_database_subnet_0" {
  vpc_id                  = aws_vpc.columbus_vpc.id
  cidr_block              = var.columbus_database_subnet_cidr_block[0]
  availability_zone       = var.availability_zones[0]

  tags = {
    Name = "columbus_vpc_database_subnet_0"
  }
}

resource "aws_subnet" "columbus_vpc_database_subnet_1" {
  vpc_id                  = aws_vpc.columbus_vpc.id
  cidr_block              = var.columbus_database_subnet_cidr_block[1]
  availability_zone       = var.availability_zones[1]

  tags = {
    Name = "columbus_vpc_database_subnet_1"
  }
}