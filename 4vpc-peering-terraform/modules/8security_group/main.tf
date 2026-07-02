#create security group for all the VPC
resource "aws_security_group" "server_public_sg" {
  name        = "server_public_sg"
  description = "Security group for detroit_server"
    vpc_id      = var.detroit_vpc
    
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = [var.outside_cidr_block]
    }
    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = [var.outside_cidr_block]
    }
    ingress { #this is for ssh access to the web server, you can remove it 
    # if you don't want to access the web server via ssh
    # you can also restrict the cidr_blocks to your own IP address for better security
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.outside_cidr_block]
    }
    tags = {
        "Name" = "server_public_sg"
    }
}


resource "aws_security_group" "app_sg" {
  name   = "app_sg"
  vpc_id = var.detroit_vpc

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.server_public_sg.id]
  }
}

resource "aws_security_group" "database_sg" {
  name   = "db_sg"
  vpc_id = var.detroit_vpc

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }
}


#########################################
#########################################
resource "aws_security_group" "server_public_sg_chicago" {
  name        = "server_public_sg"
  description = "Security group for chicago_server"
  vpc_id      = var.chicago_vpc
    
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.outside_cidr_block]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.outside_cidr_block]
  }
  ingress { #this is for ssh access to the web server, you can remove it 
    # if you don't want to access the web server via ssh
    # you can also restrict the cidr_blocks to your own IP address for better security
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.outside_cidr_block]
  }

  tags = {
    Name = "server_public_sg"
  }
}

resource "aws_security_group" "app_sg_chicago" {
  name   = "app_sg"
  vpc_id = var.chicago_vpc

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.server_public_sg_chicago.id]
  }

}

resource "aws_security_group" "database_sg_chicago" {
  name   = "db_sg"
  vpc_id = var.chicago_vpc

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg_chicago.id]
  }
}

#########################################
#########################################
#########################################
resource "aws_security_group" "server_public_sg_columbus" {
  name        = "server_public_sg"
  description = "Security group for columbus_server"
  vpc_id      = var.columbus_vpc
    
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.outside_cidr_block]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.outside_cidr_block]
  }

  ingress { #this is for ssh access to the web server, you can remove it 
    # if you don't want to access the web server via ssh
    # you can also restrict the cidr_blocks to your own IP address for better security
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.outside_cidr_block]
  }

  tags = {
    Name = "server_public_sg"
  }
}

resource "aws_security_group" "app_sg_columbus" {
  name   = "app_sg"
  vpc_id = var.columbus_vpc

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.server_public_sg_columbus.id]
  }

}

resource "aws_security_group" "database_sg_columbus" {
  name   = "db_sg"
  vpc_id = var.columbus_vpc

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg_columbus.id]
  }
}
#########################################
#########################################
#########################################
resource "aws_security_group" "server_public_sg_indianapolis" {
  name        = "server_public_sg"
  description = "Security group for indianapolis_server"
  vpc_id      = var.indianapolis_vpc
    
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.outside_cidr_block]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.outside_cidr_block]
  }

  ingress { #this is for ssh access to the web server, you can remove it 
    # if you don't want to access the web server via ssh
    # you can also restrict the cidr_blocks to your own IP address for better security
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.outside_cidr_block]
  }

  tags = {
    Name = "server_public_sg"
  }
}

resource "aws_security_group" "app_sg_indianapolis" {
  name   = "app_sg"
  vpc_id = var.indianapolis_vpc

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.server_public_sg_indianapolis.id]
  }

}

resource "aws_security_group" "database_sg_indianapolis" {
  name   = "db_sg"
  vpc_id = var.indianapolis_vpc

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg_indianapolis.id]
  }
}
#########################################
#########################################
#########################################