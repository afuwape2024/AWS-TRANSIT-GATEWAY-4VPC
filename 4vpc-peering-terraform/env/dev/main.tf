module "detroit_vpc" {
  source = "../../modules/1detroit_vpc"
  detroit_vpc                    = var.detroit_vpc
  detroit_vpc_cidr_block         = var.detroit_vpc_cidr_block
  detroit_public_subnet_cidr_block  = var.detroit_public_subnet_cidr_block
  detroit_private_subnet_cidr_block  = var.detroit_private_subnet_cidr_block
  detroit_database_subnet_cidr_block = var.detroit_database_subnet_cidr_block
  availability_zones             = var.availability_zones
}

module "chicago_vpc" {
  source = "../../modules/2chicago_vpc"

  chicago_vpc                   = var.chicago_vpc
  chicago_vpc_cidr_block        = var.chicago_vpc_cidr_block
  chicago_public_subnet_cidr_block = var.chicago_public_subnet_cidr_block
  chicago_private_subnet_cidr_block = var.chicago_private_subnet_cidr_block
  chicago_database_subnet_cidr_block  = var.chicago_database_subnet_cidr_block
  availability_zones            = var.availability_zones
}


module "columbus_vpc" {
  source = "../../modules/3columbus_vpc"

  columbus_vpc                   = var.columbus_vpc
  columbus_vpc_cidr_block        = var.columbus_vpc_cidr_block
  columbus_public_subnet_cidr_block = var.columbus_public_subnet_cidr_block
  columbus_app_subnet_cidr_block = var.columbus_private_subnet_cidr_block
  columbus_database_subnet_cidr_block  = var.columbus_database_subnet_cidr_block
  availability_zones             = var.availability_zones
}

module "indianapolis_vpc" {
  source = "../../modules/4indianapolis_vpc"

  indianapolis_vpc                   = var.indianapolis_vpc
  indianapolis_vpc_cidr_block        = var.indianapolis_vpc_cidr_block
  indianapolis_public_subnet_cidr_block = var.indianapolis_public_subnet_cidr_block
  indianapolis_app_subnet_cidr_block = var.indianapolis_private_subnet_cidr_block
  indianapolis_database_subnet_cidr_block  = var.indianapolis_database_subnet_cidr_block
  availability_zones             = var.availability_zones
}

module "internet_gateway" {
  source = "../../modules/5internet_gateway"
  chicago_vpc = module.chicago_vpc.chicago_vpc
  detroit_vpc = module.detroit_vpc.detroit_vpc
  columbus_vpc = module.columbus_vpc.columbus_vpc
  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
}

module "route_table" {
  source = "../../modules/6route_table"
  outside_cidr_block = var.outside_cidr_block
  transit_gateway_id = module.transit_gateway.central_transit_gateway
  detroit_vpc_cidr_block = var.detroit_vpc_cidr_block
  chicago_vpc_cidr_block = var.chicago_vpc_cidr_block
  columbus_vpc_cidr_block = var.columbus_vpc_cidr_block
  indianapolis_vpc_cidr_block = var.indianapolis_vpc_cidr_block

  detroit_vpc_database_subnet_0 = module.detroit_vpc.detroit_vpc_database_subnet_0
  chicago_vpc_database_subnet_0 = module.chicago_vpc.chicago_vpc_database_subnet_0
  columbus_vpc_database_subnet_0 = module.columbus_vpc.columbus_vpc_database_subnet_0
  indianapolis_vpc_database_subnet_0 = module.indianapolis_vpc.indianapolis_vpc_database_subnet_0

  detroit_vpc = module.detroit_vpc.detroit_vpc
  detroit_vpc_public_subnet = module.detroit_vpc.detroit_vpc_public_subnet
  detroit_vpc_private_subnet = module.detroit_vpc.detroit_vpc_private_subnet
  detroit_vpc_public2_subnet = module.detroit_vpc.detroit_vpc_public2_subnet
  detroit_vpc_private2_subnet = module.detroit_vpc.detroit_vpc_private2_subnet
  detroit_vpc_igw = module.internet_gateway.detroit_vpc_igw
  
  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_public_subnet = module.chicago_vpc.chicago_vpc_public_subnet
  chicago_vpc_private_subnet = module.chicago_vpc.chicago_vpc_private_subnet
  chicago_vpc_public2_subnet = module.chicago_vpc.chicago_vpc_public2_subnet
  chicago_vpc_private2_subnet = module.chicago_vpc.chicago_vpc_private2_subnet
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw 

  columbus_vpc = module.columbus_vpc.columbus_vpc
  columbus_vpc_public_subnet = module.columbus_vpc.columbus_vpc_public_subnet
  columbus_vpc_private_subnet = module.columbus_vpc.columbus_vpc_private_subnet
  columbus_vpc_public2_subnet = module.columbus_vpc.columbus_vpc_public2_subnet
  columbus_vpc_private2_subnet = module.columbus_vpc.columbus_vpc_private2_subnet
  columbus_vpc_igw = module.internet_gateway.columbus_vpc_igw 

  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_public_subnet = module.indianapolis_vpc.indianapolis_vpc_public_subnet
  indianapolis_vpc_private_subnet = module.indianapolis_vpc.indianapolis_vpc_private_subnet
  indianapolis_vpc_public2_subnet = module.indianapolis_vpc.indianapolis_vpc_public2_subnet
  indianapolis_vpc_private2_subnet = module.indianapolis_vpc.indianapolis_vpc_private2_subnet
  indianapolis_vpc_igw = module.internet_gateway.indianapolis_vpc_igw   
  
}

module "network_acl" {
  source = "../../modules/7nacl"
  outside_cidr_block = local.outside_cidr_block
  public_nacl = local.public_nacl
  app_nacls = local.app_nacls
  database_nacls = local.database_nacls
  database_ports = local.ports

  detroit_vpc        = module.detroit_vpc.detroit_vpc
  detroit_vpc_igw    = module.internet_gateway.detroit_vpc_igw
  detroit_vpc_public_subnet  = module.detroit_vpc.detroit_vpc_public_subnet
  detroit_vpc_private_subnet  = module.detroit_vpc.detroit_vpc_private_subnet
  detroit_vpc_public2_subnet = module.detroit_vpc.detroit_vpc_public2_subnet
  detroit_vpc_private2_subnet = module.detroit_vpc.detroit_vpc_private2_subnet
  detroit_vpc_database_subnet_0 = module.detroit_vpc.detroit_vpc_database_subnet_0
 
  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw
  chicago_vpc_public_subnet = module.chicago_vpc.chicago_vpc_public_subnet
  chicago_vpc_private_subnet = module.chicago_vpc.chicago_vpc_private_subnet
  chicago_vpc_public2_subnet = module.chicago_vpc.chicago_vpc_public2_subnet
  chicago_vpc_private2_subnet = module.chicago_vpc.chicago_vpc_private2_subnet
  chicago_vpc_database_subnet_0 = module.chicago_vpc.chicago_vpc_database_subnet_0

  columbus_vpc = module.columbus_vpc.columbus_vpc
  columbus_vpc_igw = module.internet_gateway.columbus_vpc_igw
  columbus_vpc_public_subnet = module.columbus_vpc.columbus_vpc_public_subnet
  columbus_vpc_private_subnet = module.columbus_vpc.columbus_vpc_private_subnet
  columbus_vpc_public2_subnet = module.columbus_vpc.columbus_vpc_public2_subnet
  columbus_vpc_private2_subnet = module.columbus_vpc.columbus_vpc_private2_subnet
  columbus_vpc_database_subnet_0 = module.columbus_vpc.columbus_vpc_database_subnet_0

  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_igw = module.internet_gateway.indianapolis_vpc_igw
  indianapolis_vpc_public_subnet = module.indianapolis_vpc.indianapolis_vpc_public_subnet
  indianapolis_vpc_private_subnet = module.indianapolis_vpc.indianapolis_vpc_private_subnet
  indianapolis_vpc_public2_subnet = module.indianapolis_vpc.indianapolis_vpc_public2_subnet
  indianapolis_vpc_private2_subnet = module.indianapolis_vpc.indianapolis_vpc_private2_subnet
  indianapolis_vpc_database_subnet_0 = module.indianapolis_vpc.indianapolis_vpc_database_subnet_0
}

module "security_group" {
  source = "../../modules/8security_group"
  outside_cidr_block = local.outside_cidr_block
  detroit_vpc        = module.detroit_vpc.detroit_vpc
  detroit_vpc_igw    = module.internet_gateway.detroit_vpc_igw
  detroit_vpc_public_subnet  = module.detroit_vpc.detroit_vpc_public_subnet
  detroit_vpc_public2_subnet = module.detroit_vpc.detroit_vpc_public2_subnet
  detroit_vpc_private_subnet  = module.detroit_vpc.detroit_vpc_private_subnet
  detroit_vpc_private2_subnet = module.detroit_vpc.detroit_vpc_private2_subnet
  detroit_vpc_database_subnet_0 = module.detroit_vpc.detroit_vpc_database_subnet_0
 
  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw
  chicago_vpc_public_subnet = module.chicago_vpc.chicago_vpc_public_subnet
  chicago_vpc_private_subnet = module.chicago_vpc.chicago_vpc_private_subnet
  chicago_vpc_public2_subnet = module.chicago_vpc.chicago_vpc_public2_subnet
  chicago_vpc_private2_subnet = module.chicago_vpc.chicago_vpc_private2_subnet
  chicago_vpc_database_subnet_0 = module.chicago_vpc.chicago_vpc_database_subnet_0

  columbus_vpc = module.columbus_vpc.columbus_vpc
  columbus_vpc_igw = module.internet_gateway.columbus_vpc_igw
  columbus_vpc_public_subnet = module.columbus_vpc.columbus_vpc_public_subnet
  columbus_vpc_private_subnet = module.columbus_vpc.columbus_vpc_private_subnet
  columbus_vpc_public2_subnet = module.columbus_vpc.columbus_vpc_public2_subnet
  columbus_vpc_private2_subnet = module.columbus_vpc.columbus_vpc_private2_subnet
  columbus_vpc_database_subnet_0 = module.columbus_vpc.columbus_vpc_database_subnet_0

  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_igw = module.internet_gateway.indianapolis_vpc_igw
  indianapolis_vpc_public_subnet = module.indianapolis_vpc.indianapolis_vpc_public_subnet
  indianapolis_vpc_private_subnet = module.indianapolis_vpc.indianapolis_vpc_private_subnet
  indianapolis_vpc_public2_subnet = module.indianapolis_vpc.indianapolis_vpc_public2_subnet
  indianapolis_vpc_private2_subnet = module.indianapolis_vpc.indianapolis_vpc_private2_subnet
  indianapolis_vpc_database_subnet_0 = module.indianapolis_vpc.indianapolis_vpc_database_subnet_0
}

module "auto_scale" {
  source = "../../modules/9app_asg"

  outside_cidr_block = local.outside_cidr_block
  detroit_public_sg_id = module.security_group.detroit_public_sg_id
  chicago_public_sg_id = module.security_group.chicago_public_sg_id
  columbus_public_sg_id = module.security_group.columbus_public_sg_id
  indianapolis_public_sg_id = module.security_group.indianapolis_public_sg_id
  detroit_target_group_arn = module.load_balancer.detroit_public_target_group
  chicago_target_group_arn = module.load_balancer.chicago_public_target_group
  columbus_target_group_arn = module.load_balancer.columbus_public_target_group
  indianapolis_target_group_arn = module.load_balancer.indianapolis_public_target_group
  image_id = var.image_id
  instance_type = var.instance_type
  key_pair_name = var.key_pair_name

  detroit_vpc = module.detroit_vpc.detroit_vpc
  detroit_vpc_public_subnet = module.detroit_vpc.detroit_vpc_public_subnet
  detroit_vpc_private_subnet = module.detroit_vpc.detroit_vpc_private_subnet
  detroit_vpc_public2_subnet = module.detroit_vpc.detroit_vpc_public2_subnet
  detroit_vpc_private2_subnet = module.detroit_vpc.detroit_vpc_private2_subnet
  detroit_vpc_database_subnet_0 = module.detroit_vpc.detroit_vpc_database_subnet_0
  detroit_vpc_igw = module.internet_gateway.detroit_vpc_igw
  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw
  chicago_vpc_public_subnet = module.chicago_vpc.chicago_vpc_public_subnet
  chicago_vpc_private_subnet = module.chicago_vpc.chicago_vpc_private_subnet
  chicago_vpc_public2_subnet = module.chicago_vpc.chicago_vpc_public2_subnet
  chicago_vpc_private2_subnet = module.chicago_vpc.chicago_vpc_private2_subnet
  chicago_vpc_database_subnet_0 = module.chicago_vpc.chicago_vpc_database_subnet_0

  columbus_vpc = module.columbus_vpc.columbus_vpc
  columbus_vpc_igw = module.internet_gateway.columbus_vpc_igw
  columbus_vpc_public_subnet = module.columbus_vpc.columbus_vpc_public_subnet
  columbus_vpc_private_subnet = module.columbus_vpc.columbus_vpc_private_subnet
  columbus_vpc_public2_subnet = module.columbus_vpc.columbus_vpc_public2_subnet
  columbus_vpc_private2_subnet = module.columbus_vpc.columbus_vpc_private2_subnet
  columbus_vpc_database_subnet_0 = module.columbus_vpc.columbus_vpc_database_subnet_0

  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_igw = module.internet_gateway.indianapolis_vpc_igw
  indianapolis_vpc_public_subnet = module.indianapolis_vpc.indianapolis_vpc_public_subnet
  indianapolis_vpc_private_subnet = module.indianapolis_vpc.indianapolis_vpc_private_subnet
  indianapolis_vpc_public2_subnet = module.indianapolis_vpc.indianapolis_vpc_public2_subnet
  indianapolis_vpc_private2_subnet = module.indianapolis_vpc.indianapolis_vpc_private2_subnet
  indianapolis_vpc_database_subnet_0 = module.indianapolis_vpc.indianapolis_vpc_database_subnet_0

}

module "load_balancer" {
  source = "../../modules/11app-alb"

  outside_cidr_block = local.outside_cidr_block
  detroit_vpc = module.detroit_vpc.detroit_vpc
  detroit_vpc_public_subnet = module.detroit_vpc.detroit_vpc_public_subnet
  detroit_vpc_app_subnet = module.detroit_vpc.detroit_vpc_private_subnet
  detroit_vpc_web2_subnet = module.detroit_vpc.detroit_vpc_public2_subnet
  detroit_vpc_app2_subnet = module.detroit_vpc.detroit_vpc_private2_subnet
  detroit_vpc_igw = module.internet_gateway.detroit_vpc_igw
  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw
  chicago_vpc_public_subnet = module.chicago_vpc.chicago_vpc_public_subnet
  chicago_vpc_app_subnet = module.chicago_vpc.chicago_vpc_private_subnet
  chicago_vpc_web2_subnet = module.chicago_vpc.chicago_vpc_public2_subnet
  chicago_vpc_app2_subnet = module.chicago_vpc.chicago_vpc_private2_subnet

  columbus_vpc = module.columbus_vpc.columbus_vpc
  columbus_vpc_igw = module.internet_gateway.columbus_vpc_igw
  columbus_vpc_public_subnet = module.columbus_vpc.columbus_vpc_public_subnet
  columbus_vpc_app_subnet = module.columbus_vpc.columbus_vpc_private_subnet
  columbus_vpc_web2_subnet = module.columbus_vpc.columbus_vpc_public2_subnet
  columbus_vpc_app2_subnet = module.columbus_vpc.columbus_vpc_private2_subnet

  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_igw = module.internet_gateway.indianapolis_vpc_igw
  indianapolis_vpc_public_subnet = module.indianapolis_vpc.indianapolis_vpc_public_subnet
  indianapolis_vpc_app_subnet = module.indianapolis_vpc.indianapolis_vpc_private_subnet
  indianapolis_vpc_web2_subnet = module.indianapolis_vpc.indianapolis_vpc_public2_subnet
  indianapolis_vpc_app2_subnet = module.indianapolis_vpc.indianapolis_vpc_private2_subnet

}

module "transit_gateway" {
  source = "../../modules/11transit_gateway"

  outside_cidr_block = local.outside_cidr_block
  detroit_vpc_cidr_block = var.detroit_vpc_cidr_block
  chicago_vpc_cidr_block = var.chicago_vpc_cidr_block
  columbus_vpc_cidr_block = var.columbus_vpc_cidr_block
  indianapolis_vpc_cidr_block = var.indianapolis_vpc_cidr_block
  detroit_vpc_database_subnet_0 = module.detroit_vpc.detroit_vpc_database_subnet_0
  chicago_vpc_database_subnet_0 = module.chicago_vpc.chicago_vpc_database_subnet_0
  columbus_vpc_database_subnet_0 = module.columbus_vpc.columbus_vpc_database_subnet_0
  indianapolis_vpc_database_subnet_0 = module.indianapolis_vpc.indianapolis_vpc_database_subnet_0

  detroit_vpc = module.detroit_vpc.detroit_vpc
  detroit_vpc_public_subnet = module.detroit_vpc.detroit_vpc_public_subnet
  detroit_vpc_private_subnet = module.detroit_vpc.detroit_vpc_private_subnet
  detroit_vpc_public2_subnet = module.detroit_vpc.detroit_vpc_public2_subnet
  detroit_vpc_private2_subnet = module.detroit_vpc.detroit_vpc_private2_subnet
  detroit_vpc_igw = module.internet_gateway.detroit_vpc_igw

  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw
  chicago_vpc_public_subnet = module.chicago_vpc.chicago_vpc_public_subnet
  chicago_vpc_private_subnet = module.chicago_vpc.chicago_vpc_private_subnet
  chicago_vpc_public2_subnet = module.chicago_vpc.chicago_vpc_public2_subnet
  chicago_vpc_private2_subnet = module.chicago_vpc.chicago_vpc_private2_subnet

  columbus_vpc = module.columbus_vpc.columbus_vpc
  columbus_vpc_igw = module.internet_gateway.columbus_vpc_igw
  columbus_vpc_public_subnet = module.columbus_vpc.columbus_vpc_public_subnet
  columbus_vpc_private_subnet = module.columbus_vpc.columbus_vpc_private_subnet
  columbus_vpc_public2_subnet = module.columbus_vpc.columbus_vpc_public2_subnet
  columbus_vpc_private2_subnet = module.columbus_vpc.columbus_vpc_private2_subnet

  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_igw = module.internet_gateway.indianapolis_vpc_igw
  indianapolis_vpc_public_subnet = module.indianapolis_vpc.indianapolis_vpc_public_subnet
  indianapolis_vpc_private_subnet = module.indianapolis_vpc.indianapolis_vpc_private_subnet
  indianapolis_vpc_public2_subnet = module.indianapolis_vpc.indianapolis_vpc_public2_subnet
  indianapolis_vpc_private2_subnet = module.indianapolis_vpc.indianapolis_vpc_private2_subnet

}

module "Single_bastion" {
  source = "../../modules/9instance"

  outside_cidr_block = local.outside_cidr_block

  detroit_vpc = module.detroit_vpc.detroit_vpc
  detroit_vpc_public_subnet = module.detroit_vpc.detroit_vpc_public_subnet
  detroit_vpc_private_subnet = module.detroit_vpc.detroit_vpc_private_subnet
  detroit_vpc_public2_subnet = module.detroit_vpc.detroit_vpc_public2_subnet
  detroit_vpc_private2_subnet = module.detroit_vpc.detroit_vpc_private2_subnet
  detroit_vpc_database_subnet_0 = module.detroit_vpc.detroit_vpc_database_subnet_0
  detroit_vpc_igw = module.internet_gateway.detroit_vpc_igw

  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_public_subnet = module.chicago_vpc.chicago_vpc_public_subnet
  chicago_vpc_private_subnet = module.chicago_vpc.chicago_vpc_private_subnet
  chicago_vpc_public2_subnet = module.chicago_vpc.chicago_vpc_public2_subnet
  chicago_vpc_private2_subnet = module.chicago_vpc.chicago_vpc_private2_subnet
  chicago_vpc_database_subnet_0 = module.chicago_vpc.chicago_vpc_database_subnet_0
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw

  columbus_vpc = module.columbus_vpc.columbus_vpc
  columbus_vpc_public_subnet = module.columbus_vpc.columbus_vpc_public_subnet
  columbus_vpc_private_subnet = module.columbus_vpc.columbus_vpc_private_subnet
  columbus_vpc_public2_subnet = module.columbus_vpc.columbus_vpc_public2_subnet
  columbus_vpc_private2_subnet = module.columbus_vpc.columbus_vpc_private2_subnet
  columbus_vpc_database_subnet_0 = module.columbus_vpc.columbus_vpc_database_subnet_0
  columbus_vpc_igw = module.internet_gateway.columbus_vpc_igw

  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_public_subnet = module.indianapolis_vpc.indianapolis_vpc_public_subnet
  indianapolis_vpc_private_subnet = module.indianapolis_vpc.indianapolis_vpc_private_subnet
  indianapolis_vpc_public2_subnet = module.indianapolis_vpc.indianapolis_vpc_public2_subnet
  indianapolis_vpc_private2_subnet = module.indianapolis_vpc.indianapolis_vpc_private2_subnet
  indianapolis_vpc_database_subnet_0 = module.indianapolis_vpc.indianapolis_vpc_database_subnet_0
  indianapolis_vpc_igw = module.internet_gateway.indianapolis_vpc_igw

  image_id = var.image_id
  instance_type = var.instance_type
  key_pair_name = var.key_pair_name

  detroit_public_sg_id = module.security_group.detroit_public_sg_id
  detroit_app_sg_id = module.security_group.detroit_app_sg_id
  detroit_db_sg_id = module.security_group.detroit_db_sg_id
}














