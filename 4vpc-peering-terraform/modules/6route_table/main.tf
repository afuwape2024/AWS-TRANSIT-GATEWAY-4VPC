#create rout table for detroit_vpc_public_subnet, with nat and private subnet
resource "aws_route_table" "detroit_vpc_public_route_table" {
  vpc_id = var.detroit_vpc  
  route {
    cidr_block = var.outside_cidr_block
    gateway_id = var.detroit_vpc_igw
    }
    tags = {
        "Name" = "detroit_vpc_public_route_table"
    }
}

#associate detroit_vpc_public_subnet with detroit_vpc_public_route_table
resource "aws_route_table_association" "detroit_vpc_public_route_table_association" {
  subnet_id      = var.detroit_vpc_public_subnet
  route_table_id = aws_route_table.detroit_vpc_public_route_table.id
}

#associate detroit_vpc_public2_subnet with detroit_vpc_public2_route_table
resource "aws_route_table_association" "detroit_vpc_public2_route_table_association" {
  subnet_id      = var.detroit_vpc_public2_subnet
  route_table_id = aws_route_table.detroit_vpc_public_route_table.id
}


#create elastic ip for nat gateway
resource "aws_eip" "detroit_eip" {
    depends_on = [ aws_route_table.detroit_vpc_public_route_table ]
  domain = "vpc"
    tags = {
        "Name" = "detroit_eip"
    }
}
#create nat gateway for detroit_vpc_private_subnet
resource "aws_nat_gateway" "detroit_nat_gw1" {
  allocation_id = aws_eip.detroit_eip.id
  subnet_id     = var.detroit_vpc_public_subnet
    tags = {
        "Name" = "detroit_nat_gw1"
    }
}  

#create route table for detroit_vpc_private_subnet
resource "aws_route_table" "detroit_vpc_private_route_table" {
  vpc_id = var.detroit_vpc
  route {
    cidr_block = var.outside_cidr_block
    nat_gateway_id = aws_nat_gateway.detroit_nat_gw1.id
    }
    tags = {
        "Name" = "detroit_vpc_private_route_table"
    }
}
###create rout table for detroit_vpc_private_subnet
resource "aws_route_table_association" "detroit_vpc_private_route_table_association" {
  subnet_id      = var.detroit_vpc_private_subnet
  route_table_id = aws_route_table.detroit_vpc_private_route_table.id
}

resource "aws_route_table_association" "detroit_vpc_private2_route_table_association" {
  subnet_id      = var.detroit_vpc_private2_subnet
  route_table_id = aws_route_table.detroit_vpc_private_route_table.id
}

#associate detroit_vpc_database_subnet
resource "aws_route_table" "detroit_vpc_private_database_route_table" {
  vpc_id = var.detroit_vpc

  tags = {
    "Name" = "detroit_vpc_private_database_route_table"
  }
}

resource "aws_route_table_association" "detroit_vpc_database_route_table_association" {
  subnet_id      = var.detroit_vpc_database_subnet_0
  route_table_id = aws_route_table.detroit_vpc_private_database_route_table.id
}

#########################################################
#FOR CONNECTION FROM SUBNET TO ANOTHER VPC THROUGH TRANSIT GATEWAY
#########################################################
resource "aws_route" "detroit_public_to_chicago" {
  route_table_id         = aws_route_table.detroit_vpc_public_route_table.id
  destination_cidr_block = var.chicago_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "detroit_public_to_columbus" {
  route_table_id         = aws_route_table.detroit_vpc_public_route_table.id
  destination_cidr_block = var.columbus_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "detroit_public_to_indianapolis" {
  route_table_id         = aws_route_table.detroit_vpc_public_route_table.id
  destination_cidr_block = var.indianapolis_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "detroit_private_to_chicago" {
  route_table_id         = aws_route_table.detroit_vpc_private_route_table.id
  destination_cidr_block = var.chicago_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "detroit_private_to_columbus" {
  route_table_id         = aws_route_table.detroit_vpc_private_route_table.id
  destination_cidr_block = var.columbus_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "detroit_private_to_indianapolis" {
  route_table_id         = aws_route_table.detroit_vpc_private_route_table.id
  destination_cidr_block = var.indianapolis_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "detroit_database_to_chicago" {
  route_table_id         = aws_route_table.detroit_vpc_private_database_route_table.id
  destination_cidr_block = var.chicago_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "detroit_database_to_columbus" {
  route_table_id         = aws_route_table.detroit_vpc_private_database_route_table.id
  destination_cidr_block = var.columbus_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "detroit_database_to_indianapolis" {
  route_table_id         = aws_route_table.detroit_vpc_private_database_route_table.id
  destination_cidr_block = var.indianapolis_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}


#==================================================================

#==================================================================
#==================================================================
#==================================================================
#create rout table for chicago_vpc_public_subnet, with nat and private subnet
resource "aws_route_table" "chicago_vpc_public_route_table" {
  vpc_id = var.chicago_vpc
  route {
    cidr_block = var.outside_cidr_block
    gateway_id = var.chicago_vpc_igw
    }
    tags = {
        "Name" = "chicago_vpc_public_route_table"
    }
}

#associate chicago_vpc_public_subnet with chicago_vpc_public_route_table
resource "aws_route_table_association" "chicago_vpc_public_route_table_association" {
  subnet_id      = var.chicago_vpc_public_subnet
  route_table_id = aws_route_table.chicago_vpc_public_route_table.id
}

#associate chicago_vpc_public2_subnet with chicago_vpc_public2_route_table
resource "aws_route_table_association" "chicago_vpc_public2_route_table_association" {
  subnet_id      = var.chicago_vpc_public2_subnet
  route_table_id = aws_route_table.chicago_vpc_public_route_table.id
}


#create elastic ip for nat gateway
resource "aws_eip" "chicago_eip" {
    depends_on = [ aws_route_table.chicago_vpc_public_route_table ]
  domain = "vpc"
    tags = {
        "Name" = "chicago_eip"
    }
}
#create nat gateway for chicago_vpc_private_subnet
resource "aws_nat_gateway" "chicago_nat_gw1" {
  allocation_id = aws_eip.chicago_eip.id
  subnet_id     = var.chicago_vpc_public_subnet
    tags = {
        "Name" = "chicago_nat_gw1"
    }
}  

#create route table for chicago_vpc_private_subnet
resource "aws_route_table" "chicago_vpc_private_route_table" {
  vpc_id = var.chicago_vpc
  route {
    cidr_block = var.outside_cidr_block
    nat_gateway_id = aws_nat_gateway.chicago_nat_gw1.id
    }
    tags = {
        "Name" = "chicago_vpc_private_route_table"
    }
}
#create rout table for chicago_vpc_private_subnet
resource "aws_route_table_association" "chicago_vpc_private_route_table_association" {
  subnet_id      = var.chicago_vpc_private_subnet
  route_table_id = aws_route_table.chicago_vpc_private_route_table.id
}

resource "aws_route_table_association" "chicago_vpc_private2_route_table_association" {
  subnet_id      = var.chicago_vpc_private2_subnet
  route_table_id = aws_route_table.chicago_vpc_private_route_table.id
}

#associate chicago_vpc_database_subnet
resource "aws_route_table" "chicago_vpc_private_database_route_table" {
  vpc_id = var.chicago_vpc

  tags = {
    "Name" = "chicago_vpc_private_database_route_table"
  }
}

resource "aws_route_table_association" "chicago_vpc_database_route_table_association" {
  subnet_id      = var.chicago_vpc_database_subnet_0
  route_table_id = aws_route_table.chicago_vpc_private_database_route_table.id
}

#########################################################
#FOR CONNECTION FROM SUBNET TO ANOTHER VPC THROUGH TRANSIT GATEWAY
#########################################################
resource "aws_route" "chicago_public_to_detroit" {
  route_table_id         = aws_route_table.chicago_vpc_public_route_table.id
  destination_cidr_block = var.detroit_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "chicago_public_to_columbus" {
  route_table_id         = aws_route_table.chicago_vpc_public_route_table.id
  destination_cidr_block = var.columbus_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "chicago_public_to_indianapolis" {
  route_table_id         = aws_route_table.chicago_vpc_public_route_table.id
  destination_cidr_block = var.indianapolis_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "chicago_private_to_detroit" {
  route_table_id         = aws_route_table.chicago_vpc_private_route_table.id
  destination_cidr_block = var.detroit_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "chicago_private_to_columbus" {
  route_table_id         = aws_route_table.chicago_vpc_private_route_table.id
  destination_cidr_block = var.columbus_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "chicago_private_to_indianapolis" {
  route_table_id         = aws_route_table.chicago_vpc_private_route_table.id
  destination_cidr_block = var.indianapolis_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "chicago_database_to_detroit" {
  route_table_id         = aws_route_table.chicago_vpc_private_database_route_table.id
  destination_cidr_block = var.detroit_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "chicago_database_to_columbus" {
  route_table_id         = aws_route_table.chicago_vpc_private_database_route_table.id
  destination_cidr_block = var.columbus_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "chicago_database_to_indianapolis" {
  route_table_id         = aws_route_table.chicago_vpc_private_database_route_table.id
  destination_cidr_block = var.indianapolis_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}
#==================================================================

#==================================================================
#==================================================================
#==================================================================

#create rout table for columbus_vpc_public_subnet, with nat and private subnet
resource "aws_route_table" "columbus_vpc_public_route_table" {
  vpc_id = var.columbus_vpc  
  route {
    cidr_block = var.outside_cidr_block
    gateway_id = var.columbus_vpc_igw
    }
    tags = {
        "Name" = "columbus_vpc_public_route_table"
    }
}

#associate columbus_vpc_public_subnet with columbus_vpc_public_route_table
resource "aws_route_table_association" "columbus_vpc_public_route_table_association" {
  subnet_id      = var.columbus_vpc_public_subnet
  route_table_id = aws_route_table.columbus_vpc_public_route_table.id
}

#associate columbus_vpc_public2_subnet with columbus_vpc_public2_route_table
resource "aws_route_table_association" "columbus_vpc_public2_route_table_association" {
  subnet_id      = var.columbus_vpc_public2_subnet
  route_table_id = aws_route_table.columbus_vpc_public_route_table.id
}


#create elastic ip for nat gateway
resource "aws_eip" "columbus_eip" {
    depends_on = [ aws_route_table.columbus_vpc_public_route_table ]
  domain = "vpc"
    tags = {
        "Name" = "columbus_eip"
    }
}
#create nat gateway for columbus_vpc_private_subnet
resource "aws_nat_gateway" "columbus_nat_gw1" {
  allocation_id = aws_eip.columbus_eip.id
  subnet_id     = var.columbus_vpc_public_subnet
    tags = {
        "Name" = "columbus_nat_gw1"
    }
}  

#create route table for columbus_vpc_private_subnet
resource "aws_route_table" "columbus_vpc_private_route_table" {
  vpc_id = var.columbus_vpc
  route {
    cidr_block = var.outside_cidr_block
    nat_gateway_id = aws_nat_gateway.columbus_nat_gw1.id
    }
    tags = {
        "Name" = "columbus_vpc_private_route_table"
    }
}
#create route table for columbus_vpc_private_subnet
resource "aws_route_table_association" "columbus_vpc_private_route_table_association" {
  subnet_id      = var.columbus_vpc_private_subnet
  route_table_id = aws_route_table.columbus_vpc_private_route_table.id
}

resource "aws_route_table_association" "columbus_vpc_private2_route_table_association" {
  subnet_id      = var.columbus_vpc_private2_subnet
  route_table_id = aws_route_table.columbus_vpc_private_route_table.id
}

#associate columbus_vpc_database_subnet
resource "aws_route_table" "columbus_vpc_private_database_route_table" {
  vpc_id = var.columbus_vpc

  tags = {
    "Name" = "columbus_vpc_private_database_route_table"
  }
}

resource "aws_route_table_association" "columbus_vpc_database_route_table_association" {
  subnet_id      = var.columbus_vpc_database_subnet_0
  route_table_id = aws_route_table.columbus_vpc_private_database_route_table.id
}

#########################################################
#FOR CONNECTION FROM SUBNET TO ANOTHER VPC THROUGH TRANSIT GATEWAY
#########################################################
resource "aws_route" "columbus_public_to_detroit" {
  route_table_id         = aws_route_table.columbus_vpc_public_route_table.id
  destination_cidr_block = var.detroit_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "columbus_public_to_chicago" {
  route_table_id         = aws_route_table.columbus_vpc_public_route_table.id
  destination_cidr_block = var.chicago_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "columbus_public_to_indianapolis" {
  route_table_id         = aws_route_table.columbus_vpc_public_route_table.id
  destination_cidr_block = var.indianapolis_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "columbus_private_to_detroit" {
  route_table_id         = aws_route_table.columbus_vpc_private_route_table.id
  destination_cidr_block = var.detroit_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "columbus_private_to_chicago" {
  route_table_id         = aws_route_table.columbus_vpc_private_route_table.id
  destination_cidr_block = var.chicago_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "columbus_private_to_indianapolis" {
  route_table_id         = aws_route_table.columbus_vpc_private_route_table.id
  destination_cidr_block = var.indianapolis_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "columbus_database_to_detroit" {
  route_table_id         = aws_route_table.columbus_vpc_private_database_route_table.id
  destination_cidr_block = var.detroit_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "columbus_database_to_chicago" {
  route_table_id         = aws_route_table.columbus_vpc_private_database_route_table.id
  destination_cidr_block = var.chicago_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "columbus_database_to_indianapolis" {
  route_table_id         = aws_route_table.columbus_vpc_private_database_route_table.id
  destination_cidr_block = var.indianapolis_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

#==================================================================

#==================================================================
#==================================================================
#==================================================================

#create rout table for indianapolis_vpc_public_subnet, with nat and private subnet
resource "aws_route_table" "indianapolis_vpc_public_route_table" {
  vpc_id = var.indianapolis_vpc  
  route {
    cidr_block = var.outside_cidr_block
    gateway_id = var.indianapolis_vpc_igw
    }
    tags = {
        "Name" = "indianapolis_vpc_public_route_table"
    }
}

#associate indianapolis_vpc_public_subnet with indianapolis_vpc_public_route_table
resource "aws_route_table_association" "indianapolis_vpc_public_route_table_association" {
  subnet_id      = var.indianapolis_vpc_public_subnet
  route_table_id = aws_route_table.indianapolis_vpc_public_route_table.id
}

#associate indianapolis_vpc_public2_subnet with indianapolis_vpc_public2_route_table
resource "aws_route_table_association" "indianapolis_vpc_public2_route_table_association" {
  subnet_id      = var.indianapolis_vpc_public2_subnet
  route_table_id = aws_route_table.indianapolis_vpc_public_route_table.id
}


#create elastic ip for nat gateway
resource "aws_eip" "indianapolis_eip" {
    depends_on = [ aws_route_table.indianapolis_vpc_public_route_table ]
  domain = "vpc"
    tags = {
        "Name" = "indianapolis_eip"
    }
}
#create nat gateway for indianapolis_vpc_private_subnet
resource "aws_nat_gateway" "indianapolis_nat_gw1" {
  allocation_id = aws_eip.indianapolis_eip.id
  subnet_id     = var.indianapolis_vpc_public_subnet
    tags = {
        "Name" = "indianapolis_nat_gw1"
    }
}  

#create route table for indianapolis_vpc_private_subnet
resource "aws_route_table" "indianapolis_vpc_private_route_table" {
  vpc_id = var.indianapolis_vpc
  route {
    cidr_block = var.outside_cidr_block
    nat_gateway_id = aws_nat_gateway.indianapolis_nat_gw1.id
    }
    tags = {
        "Name" = "indianapolis_vpc_private_route_table"
    }
}
#create rout table for indianapolis_vpc_private_subnet
resource "aws_route_table_association" "indianapolis_vpc_private_route_table_association" {
  subnet_id      = var.indianapolis_vpc_private_subnet
  route_table_id = aws_route_table.indianapolis_vpc_private_route_table.id
}

resource "aws_route_table_association" "indianapolis_vpc_private2_route_table_association" {
  subnet_id      = var.indianapolis_vpc_private2_subnet
  route_table_id = aws_route_table.indianapolis_vpc_private_route_table.id
}

#associate indianapolis_vpc_database_subnet
resource "aws_route_table" "indianapolis_vpc_private_database_route_table" {
  vpc_id = var.indianapolis_vpc

  tags = {
    "Name" = "indianapolis_vpc_private_database_route_table"
  }
}

resource "aws_route_table_association" "indianapolis_vpc_database_route_table_association" {
  subnet_id      = var.indianapolis_vpc_database_subnet_0
  route_table_id = aws_route_table.indianapolis_vpc_private_database_route_table.id
}


#########################################################
#FOR CONNECTION FROM SUBNET TO ANOTHER VPC THROUGH TRANSIT GATEWAY
#########################################################
resource "aws_route" "indianapolis_public_to_detroit" {
  route_table_id         = aws_route_table.indianapolis_vpc_public_route_table.id
  destination_cidr_block = var.detroit_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "indianapolis_public_to_chicago" {
  route_table_id         = aws_route_table.indianapolis_vpc_public_route_table.id
  destination_cidr_block = var.chicago_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "indianapolis_public_to_columbus" {
  route_table_id         = aws_route_table.indianapolis_vpc_public_route_table.id
  destination_cidr_block = var.columbus_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "indianapolis_private_to_detroit" {
  route_table_id         = aws_route_table.indianapolis_vpc_private_route_table.id
  destination_cidr_block = var.detroit_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "indianapolis_private_to_chicago" {
  route_table_id         = aws_route_table.indianapolis_vpc_private_route_table.id
  destination_cidr_block = var.chicago_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "indianapolis_private_to_columbus" {
  route_table_id         = aws_route_table.indianapolis_vpc_private_route_table.id
  destination_cidr_block = var.columbus_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "indianapolis_database_to_detroit" {
  route_table_id         = aws_route_table.indianapolis_vpc_private_database_route_table.id
  destination_cidr_block = var.detroit_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "indianapolis_database_to_chicago" {
  route_table_id         = aws_route_table.indianapolis_vpc_private_database_route_table.id
  destination_cidr_block = var.chicago_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}

resource "aws_route" "indianapolis_database_to_columbus" {
  route_table_id         = aws_route_table.indianapolis_vpc_private_database_route_table.id
  destination_cidr_block = var.columbus_vpc_cidr_block
  transit_gateway_id     = var.transit_gateway_id
}
#==================================================================

#==================================================================
#==================================================================
#==================================================================


# Wait for NAT gateways to be fully created before proceeding
resource "null_resource" "delay_nat_gateways" {
  depends_on = [
    aws_nat_gateway.detroit_nat_gw1,
    aws_nat_gateway.chicago_nat_gw1,
    aws_nat_gateway.columbus_nat_gw1,
    aws_nat_gateway.indianapolis_nat_gw1

  ]

  provisioner "local-exec" {
    command = "sleep 30"
  }
}

output "nat_gateways_ready" {
  value = null_resource.delay_nat_gateways.id
}