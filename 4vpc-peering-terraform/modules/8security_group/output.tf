#==================================
#==================================
output "detroit_public_sg_id" {
  value = aws_security_group.server_public_sg_detroit.id
}

output "detroit_app_sg_id" {
  value = aws_security_group.app_sg_detroit.id
}

output "detroit_db_sg_id" {
  value = aws_security_group.database_sg.id
}

#==================================
#==================================
output "chicago_public_sg_id" {
  value = aws_security_group.server_public_sg_chicago.id
}

output "chicago_app_sg_id" {
  value = aws_security_group.app_sg_chicago.id
}

output "chicago_db_sg_id" {
  value = aws_security_group.database_sg_chicago.id
}

#==================================
#==================================
output "columbus_public_sg_id" {
  value = aws_security_group.server_public_sg_columbus.id
}

output "columbus_app_sg_id" {
  value = aws_security_group.app_sg_columbus.id
}

output "columbus_db_sg_id" {
  value = aws_security_group.database_sg_columbus.id
}

#==================================
#==================================
output "indianapolis_public_sg_id" {
  value = aws_security_group.server_public_sg_indianapolis.id
}

output "indianapolis_app_sg_id" {
  value = aws_security_group.app_sg_indianapolis.id
}

output "indianapolis_db_sg_id" {
  value = aws_security_group.database_sg_indianapolis.id
}