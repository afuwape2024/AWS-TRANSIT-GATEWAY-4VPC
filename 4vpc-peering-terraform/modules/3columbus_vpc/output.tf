output "columbus_vpc" {
  value = aws_vpc.columbus_vpc.id
}

output "columbus_vpc_public_subnet_0" {
  value = aws_subnet.columbus_vpc_public_subnet_0.id
}

output "columbus_vpc_public_subnet_1" {
  value = aws_subnet.columbus_vpc_public_subnet_1.id
}

output "columbus_vpc_app_subnet_0" {
  value = aws_subnet.columbus_vpc_app_subnet_0.id
}

output "columbus_vpc_app_subnet_1" {
  value = aws_subnet.columbus_vpc_app_subnet_1.id
}

output "columbus_vpc_database_subnet_0" {
  value = aws_subnet.columbus_vpc_database_subnet_0.id
}

output "columbus_vpc_database_subnet_1" {
  value = aws_subnet.columbus_vpc_database_subnet_1.id
}