output "detroit_public_scaling_group" {
  value = aws_autoscaling_group.detroit_public_scaling_group.id
}
output "detroit_public_template" {
    value = aws_launch_template.detroit_public_template.id
}

#=================================================
output "chicago_public_scaling_group" {
  value = aws_autoscaling_group.chicago_public_scaling_group.id
}
output "chicago_public_template" {
    value = aws_launch_template.chicago_public_template.id
}

#=================================================
output "columbus_public_scaling_group" {
  value = aws_autoscaling_group.columbus_public_scaling_group.id
}
output "columbus_public_template" {
    value = aws_launch_template.columbus_public_template.id
}

#=================================================
output "indianapolis_public_scaling_group" {
  value = aws_autoscaling_group.indianapolis_public_scaling_group.id
}
output "indianapolis_public_template" {
    value = aws_launch_template.indianapolis_public_template.id
}

#=================================================