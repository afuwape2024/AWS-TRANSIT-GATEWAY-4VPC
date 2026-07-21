#with using the local in dev folder to configure the NACL rule
################## FOR DETROIT INFRASTRUCTURE
##################
resource "aws_network_acl" "detroit_vpc_public_nacl" {
  vpc_id = var.detroit_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 115
    protocol   = "tcp"
    action     = "allow"
    cidr_block = var.outside_cidr_block
    from_port  = 22
    to_port    = 22
  }

  ingress {
    rule_no    = local.public_nacl.ingress_http.rule_no
    protocol   = local.public_nacl.ingress_http.protocol
    action     = local.public_nacl.ingress_http.action
    cidr_block = local.public_nacl.ingress_http.cidr_block
    from_port  = local.public_nacl.ingress_http.from_port
    to_port    = local.public_nacl.ingress_http.to_port
  }

  ingress {
    rule_no    = local.public_nacl.ingress_https.rule_no
    protocol   = local.public_nacl.ingress_https.protocol
    action     = local.public_nacl.ingress_https.action
    cidr_block = local.public_nacl.ingress_https.cidr_block
    from_port  = local.public_nacl.ingress_https.from_port
    to_port    = local.public_nacl.ingress_https.to_port
  }

 

  ingress {
    rule_no    = local.public_nacl.ingress_ephemeral.rule_no
    protocol   = local.public_nacl.ingress_ephemeral.protocol
    action     = local.public_nacl.ingress_ephemeral.action
    cidr_block = local.public_nacl.ingress_ephemeral.cidr_block
    from_port  = local.public_nacl.ingress_ephemeral.from_port
    to_port    = local.public_nacl.ingress_ephemeral.to_port
  }

  egress {
    rule_no    = local.public_nacl.egress_all.rule_no
    protocol   = local.public_nacl.egress_all.protocol
    action     = local.public_nacl.egress_all.action
    cidr_block = local.public_nacl.egress_all.cidr_block
    from_port  = local.public_nacl.egress_all.from_port
    to_port    = local.public_nacl.egress_all.to_port
  }

  tags = {
    Name = "detroit_vpc_public_nacl"
  }
}
resource "aws_network_acl_association" "detroit_vpc_public_nacl_ass" {
  subnet_id      = var.detroit_vpc_public_subnet
  network_acl_id = aws_network_acl.detroit_vpc_public_nacl.id
}

resource "aws_network_acl_association" "detroit_vpc_public_nacl_ass_2" {
  subnet_id      = var.detroit_vpc_public2_subnet
  network_acl_id = aws_network_acl.detroit_vpc_public_nacl.id
}
#===================================================================

resource "aws_network_acl" "detroit_vpc_app_nacl" {
  vpc_id = var.detroit_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  # Allow internal VPC traffic
  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.app_nacls.detroit.cidr_block
    from_port  = 0
    to_port    = 0
  }

  # Allow return traffic from NAT (ephemeral ports)
  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = var.outside_cidr_block
    from_port  = 1024
    to_port    = 65535
  }

  # Allow outbound to anywhere (needed for NAT/internet access)
  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = var.outside_cidr_block
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "detroit_vpc_app_nacl"
  }
}

resource "aws_network_acl_association" "detroit_vpc_app_nacl_ass" {
  subnet_id      = var.detroit_vpc_private_subnet
  network_acl_id = aws_network_acl.detroit_vpc_app_nacl.id
}

resource "aws_network_acl_association" "detroit_vpc_app_nacl_ass_2" {
  subnet_id      = var.detroit_vpc_private2_subnet
  network_acl_id = aws_network_acl.detroit_vpc_app_nacl.id
}
#===================================================================

resource "aws_network_acl" "detroit_vpc_database_nacl" {
  vpc_id = var.detroit_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  # Allow Database access ONLY from app/private subnet
  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.detroit.app_cidr
    from_port  = local.database_ports.mysql
    to_port    = local.database_ports.mysql
  }

  # Allow return traffic to app subnet (ephemeral ports)
  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.detroit.app_cidr
    from_port  = 1024
    to_port    = 65535
  }

  # Allow outbound back to app subnet
  egress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.detroit.app_cidr
    from_port  = local.database_ports.mysql
    to_port    = local.database_ports.mysql
  }

  # Allow outbound ephemeral (responses)
  egress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.detroit.app_cidr
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    Name = "detroit_vpc_database_nacl"
  }
}


################## FOR CHICAGO INFRASTRUCTURE
##################
################## FOR CHICAGO INFRASTRUCTURE
##################
resource "aws_network_acl" "chicago_vpc_public_nacl" {
  vpc_id = var.chicago_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = local.public_nacl.ingress_http.rule_no
    protocol   = local.public_nacl.ingress_http.protocol
    action     = local.public_nacl.ingress_http.action
    cidr_block = local.public_nacl.ingress_http.cidr_block
    from_port  = local.public_nacl.ingress_http.from_port
    to_port    = local.public_nacl.ingress_http.to_port
  }

  ingress {
    rule_no    = local.public_nacl.ingress_https.rule_no
    protocol   = local.public_nacl.ingress_https.protocol
    action     = local.public_nacl.ingress_https.action
    cidr_block = local.public_nacl.ingress_https.cidr_block
    from_port  = local.public_nacl.ingress_https.from_port
    to_port    = local.public_nacl.ingress_https.to_port
  }

  ingress {
    rule_no    = local.public_nacl.ingress_ephemeral.rule_no
    protocol   = local.public_nacl.ingress_ephemeral.protocol
    action     = local.public_nacl.ingress_ephemeral.action
    cidr_block = local.public_nacl.ingress_ephemeral.cidr_block
    from_port  = local.public_nacl.ingress_ephemeral.from_port
    to_port    = local.public_nacl.ingress_ephemeral.to_port
  }

  egress {
    rule_no    = local.public_nacl.egress_all.rule_no
    protocol   = local.public_nacl.egress_all.protocol
    action     = local.public_nacl.egress_all.action
    cidr_block = local.public_nacl.egress_all.cidr_block
    from_port  = local.public_nacl.egress_all.from_port
    to_port    = local.public_nacl.egress_all.to_port
  }

  tags = { Name = "chicago_vpc_public_nacl" }
}

resource "aws_network_acl_association" "chicago_public_1" {
  subnet_id      = var.chicago_vpc_public_subnet
  network_acl_id = aws_network_acl.chicago_vpc_public_nacl.id
}

resource "aws_network_acl_association" "chicago_public_2" {
  subnet_id      = var.chicago_vpc_public2_subnet
  network_acl_id = aws_network_acl.chicago_vpc_public_nacl.id
}

resource "aws_network_acl" "chicago_vpc_app_nacl" {
  vpc_id = var.chicago_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.app_nacls.chicago.cidr_block
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = var.outside_cidr_block
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = var.outside_cidr_block
    from_port  = 0
    to_port    = 0
  }

  tags = { Name = "chicago_vpc_app_nacl" }
}

resource "aws_network_acl_association" "chicago_app_1" {
  subnet_id      = var.chicago_vpc_private_subnet
  network_acl_id = aws_network_acl.chicago_vpc_app_nacl.id
}

resource "aws_network_acl_association" "chicago_app_2" {
  subnet_id      = var.chicago_vpc_private2_subnet
  network_acl_id = aws_network_acl.chicago_vpc_app_nacl.id
}

# DATABASE NACL FOR CHICAGO

resource "aws_network_acl" "chicago_vpc_database_nacl" {
  vpc_id = var.chicago_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.chicago.app_cidr
    from_port  = local.database_ports.mysql
    to_port    = local.database_ports.mysql
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.chicago.app_cidr
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.chicago.app_cidr
    from_port  = local.database_ports.mysql
    to_port    = local.database_ports.mysql
  }

  egress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.chicago.app_cidr
    from_port  = 1024
    to_port    = 65535
  }

  tags = { Name = "chicago_vpc_database_nacl" }
}

################## FOR COLUMBUS PROVISION
##################
################## FOR COLUMBUS PROVISION
##################

resource "aws_network_acl" "columbus_vpc_public_nacl" {
  vpc_id = var.columbus_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  # same ingress/egress as above
  tags = { Name = "columbus_vpc_public_nacl" }
}

resource "aws_network_acl_association" "columbus_public_1" {
  subnet_id      = var.columbus_vpc_public_subnet
  network_acl_id = aws_network_acl.columbus_vpc_public_nacl.id
}

resource "aws_network_acl_association" "columbus_public_2" {
  subnet_id      = var.columbus_vpc_public2_subnet
  network_acl_id = aws_network_acl.columbus_vpc_public_nacl.id
}

resource "aws_network_acl" "columbus_vpc_app_nacl" {
  vpc_id = var.columbus_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.app_nacls.columbus.cidr_block
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = var.outside_cidr_block
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = var.outside_cidr_block
    from_port  = 0
    to_port    = 0
  }

  tags = { Name = "columbus_vpc_app_nacl" }
}

resource "aws_network_acl" "columbus_vpc_database_nacl" {
  vpc_id = var.columbus_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.columbus.app_cidr
    from_port  = local.database_ports.mysql
    to_port    = local.database_ports.mysql
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.columbus.app_cidr
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.columbus.app_cidr
    from_port  = local.database_ports.mysql
    to_port    = local.database_ports.mysql
  }

  egress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.columbus.app_cidr
    from_port  = 1024
    to_port    = 65535
  }

  tags = { Name = "columbus_vpc_database_nacl" }
}


################## FOR INDIANAPOLIS PROVISION
##################
################## FOR INDIANAPOLIS PROVISION
##################
resource "aws_network_acl" "indianapolis_vpc_public_nacl" {
  vpc_id = var.indianapolis_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  # same ingress/egress as your public_nacl locals
  ingress {
    rule_no    = local.public_nacl.ingress_http.rule_no
    protocol   = local.public_nacl.ingress_http.protocol
    action     = local.public_nacl.ingress_http.action
    cidr_block = local.public_nacl.ingress_http.cidr_block
    from_port  = local.public_nacl.ingress_http.from_port
    to_port    = local.public_nacl.ingress_http.to_port
  }

  ingress {
    rule_no    = local.public_nacl.ingress_https.rule_no
    protocol   = local.public_nacl.ingress_https.protocol
    action     = local.public_nacl.ingress_https.action
    cidr_block = local.public_nacl.ingress_https.cidr_block
    from_port  = local.public_nacl.ingress_https.from_port
    to_port    = local.public_nacl.ingress_https.to_port
  }

  ingress {
    rule_no    = local.public_nacl.ingress_ephemeral.rule_no
    protocol   = local.public_nacl.ingress_ephemeral.protocol
    action     = local.public_nacl.ingress_ephemeral.action
    cidr_block = local.public_nacl.ingress_ephemeral.cidr_block
    from_port  = local.public_nacl.ingress_ephemeral.from_port
    to_port    = local.public_nacl.ingress_ephemeral.to_port
  }

  egress {
    rule_no    = local.public_nacl.egress_all.rule_no
    protocol   = local.public_nacl.egress_all.protocol
    action     = local.public_nacl.egress_all.action
    cidr_block = local.public_nacl.egress_all.cidr_block
    from_port  = local.public_nacl.egress_all.from_port
    to_port    = local.public_nacl.egress_all.to_port
  }

  tags = {
    Name = "indianapolis_vpc_public_nacl"
  }
}

resource "aws_network_acl_association" "indianapolis_public_1" {
  subnet_id      = var.indianapolis_vpc_public_subnet
  network_acl_id = aws_network_acl.indianapolis_vpc_public_nacl.id
}

resource "aws_network_acl_association" "indianapolis_public_2" {
  subnet_id      = var.indianapolis_vpc_public2_subnet
  network_acl_id = aws_network_acl.indianapolis_vpc_public_nacl.id
}

resource "aws_network_acl" "indianapolis_vpc_app_nacl" {
  vpc_id = var.indianapolis_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.app_nacls.indianapolis.cidr_block
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = var.outside_cidr_block
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = var.outside_cidr_block
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "indianapolis_vpc_app_nacl"
  }
}

resource "aws_network_acl_association" "indianapolis_app_1" {
  subnet_id      = var.indianapolis_vpc_private_subnet
  network_acl_id = aws_network_acl.indianapolis_vpc_app_nacl.id
}

resource "aws_network_acl_association" "indianapolis_app_2" {
  subnet_id      = var.indianapolis_vpc_private2_subnet
  network_acl_id = aws_network_acl.indianapolis_vpc_app_nacl.id
}


resource "aws_network_acl" "indianapolis_vpc_database_nacl" {
  vpc_id = var.indianapolis_vpc

  ingress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 90
    protocol   = "-1"
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.indianapolis.app_cidr
    from_port  = local.database_ports.mysql
    to_port    = local.database_ports.mysql
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.indianapolis.app_cidr
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.indianapolis.app_cidr
    from_port  = local.database_ports.mysql
    to_port    = local.database_ports.mysql
  }

  egress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.database_nacls.indianapolis.app_cidr
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    Name = "indianapolis_vpc_database_nacl"
  }
}