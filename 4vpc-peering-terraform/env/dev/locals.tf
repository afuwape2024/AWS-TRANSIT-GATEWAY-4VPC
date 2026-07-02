locals {
  region             = var.region
  outside_cidr_block = var.outside_cidr_block
  availability_zones = var.availability_zones
  image_id= var.image_id
  instance_type = var.instance_type
  # Public NACL (local will be configure in NACL folder main.tf)

  public_nacl = {
    ingress_http = {
      rule_no    = 100
      protocol   = "tcp"
      action     = "allow"
      cidr_block = var.outside_cidr_block
      from_port  = 80
      to_port    = 80
    }

    ingress_https = {
      rule_no    = 110
      protocol   = "tcp"
      action     = "allow"
      cidr_block = var.outside_cidr_block
      from_port  = 443
      to_port    = 443
    }

    ingress_ephemeral = {
      rule_no    = 120
      protocol   = "tcp"
      action     = "allow"
      cidr_block = var.outside_cidr_block
      from_port  = 1024
      to_port    = 65535
    }

    egress_all = {
      rule_no    = 130
      protocol   = "-1"
      action     = "allow"
      cidr_block = var.outside_cidr_block
      from_port  = 0
      to_port    = 0
    }
  }

  # ========================
  # ========================
  # Private/app NACL rules per city 
  # ONLY access from the public_subnet

  app_nacls = {
    detroit = {
      public_cidrs = var.detroit_public_subnet_cidr_block
      db_cidrs  = var.detroit_database_subnet_cidr_block
      cidr_block = var.detroit_public_subnet_cidr_block[0]
    }
    chicago = {
      public_cidrs = var.chicago_public_subnet_cidr_block
      db_cidrs  = var.chicago_database_subnet_cidr_block
      cidr_block = var.chicago_public_subnet_cidr_block[0]
    }
    columbus = {
      public_cidrs = var.columbus_public_subnet_cidr_block
      db_cidrs  = var.columbus_database_subnet_cidr_block
      cidr_block = var.columbus_public_subnet_cidr_block[0]
    }
    indianapolis = {
      public_cidrs = var.indianapolis_public_subnet_cidr_block
      db_cidrs  = var.indianapolis_database_subnet_cidr_block
      cidr_block = var.indianapolis_public_subnet_cidr_block[0]
    }
  }

  # ========================
  # ========================
  # Database NACL rules
  # ONLY access from the app_subnet 

  database_nacls = {
    detroit = {
      app_cidrs = var.detroit_app_subnet_cidr_block
      app_cidr  = var.detroit_app_subnet_cidr_block[0]
    }
    chicago = {
      app_cidrs = var.chicago_app_subnet_cidr_block
      app_cidr  = var.chicago_app_subnet_cidr_block[0]
    }
    columbus = {
      app_cidrs = var.columbus_app_subnet_cidr_block
      app_cidr  = var.columbus_app_subnet_cidr_block[0]
    }
    indianapolis = {
      app_cidrs = var.indianapolis_app_subnet_cidr_block
      app_cidr  = var.indianapolis_app_subnet_cidr_block[0]
    }
  }

  # ========================
  # ========================
  # ========================
  ports = {
    public_http  = 80
    public_https = 443
    app       = 8080
    mysql     = 3306
    ephemeral_from = 1024
    ephemeral_to   = 65535
  }
}

