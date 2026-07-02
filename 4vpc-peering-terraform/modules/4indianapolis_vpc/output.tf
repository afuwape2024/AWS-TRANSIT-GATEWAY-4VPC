output "indianapolis_vpc" {
  value = aws_vpc.indianapolis_vpc.id
}

output "indianapolis_vpc_public_subnet_0" {
  value = aws_subnet.indianapolis_vpc_public_subnet_0.id
}

output "indianapolis_vpc_public_subnet_1" {
  value = aws_subnet.indianapolis_vpc_public_subnet_1.id
}

output "indianapolis_vpc_app_subnet_0" {
  value = aws_subnet.indianapolis_vpc_app_subnet_0.id
}

output "indianapolis_vpc_app_subnet_1" {
  value = aws_subnet.indianapolis_vpc_app_subnet_1.id
}

output "indianapolis_vpc_database_subnet_0" {
  value = aws_subnet.indianapolis_vpc_database_subnet_0.id
}

output "indianapolis_vpc_database_subnet_1" {
  value = aws_subnet.indianapolis_vpc_database_subnet_1.id
}