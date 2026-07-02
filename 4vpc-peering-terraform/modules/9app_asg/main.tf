resource "aws_launch_template" "detroit_public_template" {
  name_prefix   = "public-server"
  image_id      = var.image_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.detroit_public_sg_id]
  }

  placement {
    availability_zone = "us-east-2a"
  }

  user_data = filebase64("${path.module}/user-data.sh")

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "detroit_public_template"
    }
  }
}
#======================================================================================

resource "aws_autoscaling_group" "detroit_public_scaling_group" {
  name                      = "detroit_public_scaling_group"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_type         = "EC2"
  desired_capacity          = var.desired_capacity
  force_delete              = true
 #placement_group           = aws_placement_group.test.id
  vpc_zone_identifier       = [var.detroit_vpc_private_subnet, var.detroit_vpc_private2_subnet]
  target_group_arns         = [var.detroit_target_group_arn]

  launch_template {
    id      = aws_launch_template.detroit_public_template.id
    version = "$Latest"
  }

  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 120
  }
  health_check_grace_period = 30

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "Name"
    value               = "detroit_web-asg-instance"
    propagate_at_launch = true
  }
}
#======================================================================================
#======================================================================================
#======================================================================================
resource "aws_launch_template" "chicago_public_template" {
  name_prefix   = "public-server"
  image_id      = var.image_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.chicago_public_sg_id]
  }

  placement {
    availability_zone = "us-east-2a"
  }

  user_data = filebase64("${path.module}/user-data.sh")

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "chicago_public_template"
    }
  }
}
#======================================================================================

resource "aws_autoscaling_group" "chicago_public_scaling_group" {
  name                      = "chicago_public_scaling_group"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_type         = "EC2"
  desired_capacity          = var.desired_capacity
  force_delete              = true
 #placement_group           = aws_placement_group.test.id
  vpc_zone_identifier       = [var.chicago_vpc_private_subnet, var.chicago_vpc_private2_subnet]
  target_group_arns         = [var.chicago_target_group_arn]

  launch_template {
    id      = aws_launch_template.chicago_public_template.id
    version = "$Latest"
  }

  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 120
  }
  health_check_grace_period = 30

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "Name"
    value               = "chicago_web-asg-instance"
    propagate_at_launch = true
  }
}

#======================================================================================
#======================================================================================
#======================================================================================
resource "aws_launch_template" "columbus_public_template" {
  name_prefix   = "public-server"
  image_id      = var.image_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.columbus_public_sg_id]
  }

  placement {
    availability_zone = "us-east-2a"
  }

  user_data = filebase64("${path.module}/user-data.sh")

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "columbus_public_template"
    }
  }
}
#======================================================================================

resource "aws_autoscaling_group" "columbus_public_scaling_group" {
  name                      = "columbus_public_scaling_group"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_type         = "EC2"
  desired_capacity          = var.desired_capacity
  force_delete              = true
 #placement_group           = aws_placement_group.test.id
  vpc_zone_identifier       = [var.columbus_vpc_private_subnet, var.columbus_vpc_private2_subnet]
  target_group_arns         = [var.columbus_target_group_arn]

  launch_template {
    id      = aws_launch_template.columbus_public_template.id
    version = "$Latest"
  }

  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 120
  }
  health_check_grace_period = 30

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "Name"
    value               = "columbus_web-asg-instance"
    propagate_at_launch = true
  }
}
#======================================================================================
#======================================================================================
#======================================================================================

resource "aws_launch_template" "indianapolis_public_template" {
  name_prefix   = "public-server"
  image_id      = var.image_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.indianapolis_public_sg_id]
  }

  placement {
    availability_zone = "us-east-2a"
  }

  user_data = filebase64("${path.module}/user-data.sh")

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "indianapolis_public_template"
    }
  }
}
#======================================================================================

resource "aws_autoscaling_group" "indianapolis_public_scaling_group" {
  name                      = "indianapolis_public_scaling_group"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_type         = "EC2"
  desired_capacity          = var.desired_capacity
  force_delete              = true
 #placement_group           = aws_placement_group.test.id
  vpc_zone_identifier       = [var.indianapolis_vpc_private_subnet, var.indianapolis_vpc_private2_subnet]
  target_group_arns         = [var.indianapolis_target_group_arn]

  launch_template {
    id      = aws_launch_template.indianapolis_public_template.id
    version = "$Latest"
  }

  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 120
  }
  health_check_grace_period = 30

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "Name"
    value               = "indianapolis_web-asg-instance"
    propagate_at_launch = true
  }
}