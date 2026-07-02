output "detriot_load_balancer_security_group" {
    value = aws_security_group.detriot_load_balancer_security_group.id
}
output "detroit_public_target_group" {
    value = aws_lb_target_group.detroit_public_target_group.arn
}
output "detroit_application_lb"{
    value = aws_lb.detroit_application_lb.id
}
output "detroit_app_listener" {
    value = aws_lb_listener.detroit_app_listener.id
}

#=============================================================================
output "chicago_load_balancer_security_group" {
  value = aws_security_group.chicago_load_balancer_security_group.id
}

output "chicago_public_target_group" {
  value = aws_lb_target_group.chicago_public_target_group.arn
}

output "chicago_application_lb" {
  value = aws_lb.chicago_application_lb.id
}

output "chicago_app_listener" {
  value = aws_lb_listener.chicago_app_listener.id
}

#=============================================================================
output "columbus_load_balancer_security_group" {
  value = aws_security_group.columbus_load_balancer_security_group.id
}

output "columbus_public_target_group" {
  value = aws_lb_target_group.columbus_public_target_group.arn
}

output "columbus_application_lb" {
  value = aws_lb.columbus_application_lb.id
}

output "columbus_app_listener" {
  value = aws_lb_listener.columbus_app_listener.id
}
#=============================================================================
output "indianapolis_load_balancer_security_group" {
  value = aws_security_group.indianapolis_load_balancer_security_group.id
}

output "indianapolis_public_target_group" {
  value = aws_lb_target_group.indianapolis_public_target_group.arn
}

output "indianapolis_application_lb" {
  value = aws_lb.indianapolis_application_lb.id
}

output "indianapolis_app_listener" {
  value = aws_lb_listener.indianapolis_app_listener.id
}
#=============================================================================