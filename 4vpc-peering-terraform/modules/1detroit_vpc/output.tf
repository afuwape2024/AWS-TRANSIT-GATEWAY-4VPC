output "detroit_vpc" {
  value = aws_vpc.detroit_vpc.id
}
output "detroit_vpc_public_subnet_0" {
  value = aws_subnet.detroit_vpc_public_subnet_0.id
}
output "detroit_vpc_public_subnet_1" {
  value = aws_subnet.detroit_vpc_public_subnet_1.id
}
output "detroit_vpc_app_subnet_0" {
  value = aws_subnet.detroit_vpc_app_subnet_0.id
}
output "detroit_vpc_app_subnet_1" {
  value = aws_subnet.detroit_vpc_app_subnet_1.id
}
output "detroit_vpc_database_subnet_0" {
  value = aws_subnet.detroit_vpc_database_subnet_0.id
}
output "detroit_vpc_database_subnet_1" {
  value = aws_subnet.detroit_vpc_database_subnet_1.id
}
