
resource "aws_security_group" "detriot_load_balancer_security_group" {
  name        = "load_balancer_security_group"
  description = "Allow HTTP from Internet"
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.outside_cidr_block]
  }

  tags = {
    Name = "load_balancer_security_group"
  }
}

#======================================================================================
#create target group first before load balancer

resource "aws_lb_target_group" "detroit_public_target_group" {
  name_prefix = "webtg-"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.detroit_vpc
  target_type = "instance"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = var.detroit_public_target_group
  }
}
#======================================================================================

resource "aws_lb" "detroit_application_lb" {
  name               = "detroit-application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.detriot_load_balancer_security_group.id]
  subnets            = [var.detroit_vpc_public_subnet, var.detroit_vpc_web2_subnet]

  tags = {
    Environment = "detroit_application_lb"
  }
}


resource "aws_lb_listener" "detroit_app_listener" {
  load_balancer_arn = aws_lb.detroit_application_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.detroit_public_target_group.arn
  }
}

#======================================================================================
#======================================================================================
#======================================================================================

resource "aws_security_group" "chicago_load_balancer_security_group" {
  name        = "load_balancer_security_group"
  description = "Allow HTTP from Internet"
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.outside_cidr_block]
  }

  tags = {
    Name = "load_balancer_security_group"
  }
}

#======================================================================================
#create target group first before load balancer

resource "aws_lb_target_group" "chicago_public_target_group" {
  name_prefix = "webtg-"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.chicago_vpc
  target_type = "instance"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = var.chicago_public_target_group
  }
}
#======================================================================================

resource "aws_lb" "chicago_application_lb" {
  name               = "chicago-application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.chicago_load_balancer_security_group.id]
  subnets            = [var.chicago_vpc_public_subnet, var.chicago_vpc_web2_subnet]

  tags = {
    Environment = "chicago_application_lb"
  }
}

resource "aws_lb_listener" "chicago_app_listener" {
  load_balancer_arn = aws_lb.chicago_application_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.chicago_public_target_group.arn
  }
}

#======================================================================================
#======================================================================================
#======================================================================================
resource "aws_security_group" "columbus_load_balancer_security_group" {
  name        = "load_balancer_security_group"
  description = "Allow HTTP from Internet"
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.outside_cidr_block]
  }

  tags = {
    Name = "load_balancer_security_group"
  }
}

#======================================================================================
#create target group first before load balancer

resource "aws_lb_target_group" "columbus_public_target_group" {
  name_prefix = "webtg-"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.columbus_vpc
  target_type = "instance"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = var.columbus_public_target_group
  }
}
#======================================================================================

resource "aws_lb" "columbus_application_lb" {
  name               = "columbus-application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.columbus_load_balancer_security_group.id]
  subnets            = [var.columbus_vpc_public_subnet, var.columbus_vpc_web2_subnet]

  tags = {
    Environment = "columbus_application_lb"
  }
}

resource "aws_lb_listener" "columbus_app_listener" {
  load_balancer_arn = aws_lb.columbus_application_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.columbus_public_target_group.arn
  }
}

#======================================================================================
#======================================================================================
#======================================================================================

resource "aws_security_group" "indianapolis_load_balancer_security_group" {
  name        = "load_balancer_security_group"
  description = "Allow HTTP from Internet"
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.outside_cidr_block]
  }

  tags = {
    Name = "load_balancer_security_group"
  }
}

#======================================================================================
#create target group first before load balancer

resource "aws_lb_target_group" "indianapolis_public_target_group" {
  name_prefix = "webtg-"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.indianapolis_vpc
  target_type = "instance"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = var.indianapolis_public_target_group
  }
}
#======================================================================================

resource "aws_lb" "indianapolis_application_lb" {
  name               = "indianapolis-application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.indianapolis_load_balancer_security_group.id]
  subnets            = [var.indianapolis_vpc_public_subnet, var.indianapolis_vpc_web2_subnet]

  tags = {
    Environment = "indianapolis_application_lb"
  }
}

resource "aws_lb_listener" "indianapolis_app_listener" {
  load_balancer_arn = aws_lb.indianapolis_application_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.indianapolis_public_target_group.arn
  }
}
#======================================================================================
#======================================================================================
#======================================================================================