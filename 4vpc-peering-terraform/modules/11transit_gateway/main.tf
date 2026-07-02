#create central AWS Transit Gateway

resource "aws_ec2_transit_gateway" "central-transit-gateway" {
  description                     = "Central transit gateway for 4 VPCs"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support                     = "enable"

  tags = {
    Name = "central-transit-gateway"
  }
}

#Resource: aws_ec2_transit_gateway_vpc_attachment
############################################################
###########################################################
#Using private subnet AWS creates Elastic Network Interfaces (ENIs) in the subnets to communicate between VPC
resource "aws_ec2_transit_gateway_vpc_attachment" "detroit_transit_vpc" {
  subnet_ids         = [var.detroit_vpc_private_subnet, var.detroit_vpc_private2_subnet]
  transit_gateway_id = aws_ec2_transit_gateway.central-transit-gateway.id
  vpc_id             = var.detroit_vpc
  tags = {
    Name = "detroit-transit-vpc-attachment"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "chicago_transit_vpc" {
  subnet_ids         = [var.chicago_vpc_private_subnet, var.chicago_vpc_private2_subnet]
  transit_gateway_id = aws_ec2_transit_gateway.central-transit-gateway.id
  vpc_id             = var.chicago_vpc
  tags = {
    Name = "chicago-transit-vpc-attachment"
  }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "columbus_transit_vpc" {
  subnet_ids         = [var.columbus_vpc_private_subnet, var.columbus_vpc_private2_subnet]
  transit_gateway_id = aws_ec2_transit_gateway.central-transit-gateway.id
  vpc_id             = var.columbus_vpc
  tags = {
    Name = "columbus-transit-vpc-attachment"
  }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "indianapolis_transit_vpc" {
  subnet_ids         = [var.indianapolis_vpc_private_subnet, var.indianapolis_vpc_private2_subnet]
  transit_gateway_id = aws_ec2_transit_gateway.central-transit-gateway.id
  vpc_id             = var.indianapolis_vpc
  tags = {
    Name = "indianapolis-transit-vpc-attachment"
  }
}
