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

# Create and update route table for Detroit transit-gateway attachment
resource "aws_ec2_transit_gateway_route_table" "detroit_transit_gateway_route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.central-transit-gateway.id

  tags = {
    Name = "detroit-transit-gateway-route-table"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "detroit_transit_gateway_route_table_association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.detroit_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.detroit_transit_gateway_route_table.id
  replace_existing_association   = true
}

#For propagation of transit gateway route table
resource "aws_ec2_transit_gateway_route_table_propagation" "detroit_transit_gateway_route_table_propagation" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.detroit_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.detroit_transit_gateway_route_table.id
}

#FOR CONNECTION BETWEEN RESOURCE BETWEEN VPC TO COMMUNICATE
########################################################################
resource "aws_ec2_transit_gateway_route" "detroit_to_chicago" {
  destination_cidr_block         = var.chicago_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.chicago_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.detroit_transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route" "detroit_to_columbus" {
  destination_cidr_block         = var.columbus_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.columbus_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.detroit_transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route" "detroit_to_indianapolis" {
  destination_cidr_block         = var.indianapolis_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.indianapolis_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.detroit_transit_gateway_route_table.id
}


############################################################
###########################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "chicago_transit_vpc" {
  subnet_ids         = [var.chicago_vpc_private_subnet, var.chicago_vpc_private2_subnet]
  transit_gateway_id = aws_ec2_transit_gateway.central-transit-gateway.id
  vpc_id             = var.chicago_vpc
  tags = {
    Name = "chicago-transit-vpc-attachment"
  }
}

# Create and update route table for Chicago transit-gateway attachment
resource "aws_ec2_transit_gateway_route_table" "chicago_transit_gateway_route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.central-transit-gateway.id

  tags = {
    Name = "chicago-transit-gateway-route-table"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "chicago_transit_gateway_route_table_association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.chicago_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.chicago_transit_gateway_route_table.id
  replace_existing_association   = true
}

# For propagation of transit gateway route table
resource "aws_ec2_transit_gateway_route_table_propagation" "chicago_transit_gateway_route_table_propagation" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.chicago_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.chicago_transit_gateway_route_table.id
}

#FOR CONNECTION BETWEEN RESOURCE BETWEEN VPC TO COMMUNICATE
########################################################################
resource "aws_ec2_transit_gateway_route" "chicago_to_detroit" {
  destination_cidr_block         = var.detroit_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.detroit_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.chicago_transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route" "chicago_to_columbus" {
  destination_cidr_block         = var.columbus_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.columbus_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.chicago_transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route" "chicago_to_indianapolis" {
  destination_cidr_block         = var.indianapolis_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.indianapolis_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.chicago_transit_gateway_route_table.id
}


############################################################
###########################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "columbus_transit_vpc" {
  subnet_ids         = [var.columbus_vpc_private_subnet, var.columbus_vpc_private2_subnet]
  transit_gateway_id = aws_ec2_transit_gateway.central-transit-gateway.id
  vpc_id             = var.columbus_vpc
  tags = {
    Name = "columbus-transit-vpc-attachment"
  }
}

# Create and update route table for Columbus transit-gateway attachment
resource "aws_ec2_transit_gateway_route_table" "columbus_transit_gateway_route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.central-transit-gateway.id

  tags = {
    Name = "columbus-tgw-route-table"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "columbus_transit_gateway_route_table_association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.columbus_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.columbus_transit_gateway_route_table.id
  replace_existing_association   = true
}

# For propagation of transit gateway route table
resource "aws_ec2_transit_gateway_route_table_propagation" "columbus_transit_gateway_route_table_propagation" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.columbus_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.columbus_transit_gateway_route_table.id
}

#FOR CONNECTION BETWEEN RESOURCE BETWEEN VPC TO COMMUNICATE
########################################################################
resource "aws_ec2_transit_gateway_route" "columbus_to_detroit" {
  destination_cidr_block         = var.detroit_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.detroit_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.columbus_transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route" "columbus_to_chicago" {
  destination_cidr_block         = var.chicago_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.chicago_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.columbus_transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route" "columbus_to_indianapolis" {
  destination_cidr_block         = var.indianapolis_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.indianapolis_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.columbus_transit_gateway_route_table.id
}



############################################################
###########################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "indianapolis_transit_vpc" {
  subnet_ids         = [var.indianapolis_vpc_private_subnet, var.indianapolis_vpc_private2_subnet]
  transit_gateway_id = aws_ec2_transit_gateway.central-transit-gateway.id
  vpc_id             = var.indianapolis_vpc
  tags = {
    Name = "indianapolis-transit-vpc-attachment"
  }
}

# Create and update route table for Indianapolis transit-gateway attachment
resource "aws_ec2_transit_gateway_route_table" "indianapolis_transit_gateway_route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.central-transit-gateway.id

  tags = {
    Name = "indianapolis-transit-gateway-route-table"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "indianapolis_transit_gateway_route_table_association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.indianapolis_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.indianapolis_transit_gateway_route_table.id
  replace_existing_association   = true
}

# For propagation of transit gateway route table
resource "aws_ec2_transit_gateway_route_table_propagation" "indianapolis_transit_gateway_route_table_propagation" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.indianapolis_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.indianapolis_transit_gateway_route_table.id
}

#FOR CONNECTION BETWEEN RESOURCE BETWEEN VPC TO COMMUNICATE
########################################################################
resource "aws_ec2_transit_gateway_route" "indianapolis_to_detroit" {
  destination_cidr_block         = var.detroit_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.detroit_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.indianapolis_transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route" "indianapolis_to_chicago" {
  destination_cidr_block         = var.chicago_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.chicago_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.indianapolis_transit_gateway_route_table.id
}

resource "aws_ec2_transit_gateway_route" "indianapolis_to_columbus" {
  destination_cidr_block         = var.columbus_vpc_cidr_block
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.columbus_transit_vpc.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.indianapolis_transit_gateway_route_table.id
}
