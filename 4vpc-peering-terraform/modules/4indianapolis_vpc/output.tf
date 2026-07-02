output "indianapolis_vpc" {
  value = aws_vpc.indianapolis_vpc.id
}

output "indianapolis_vpc_public_subnet" {
  value = aws_subnet.indianapolis_vpc_public_subnet.id
}

output "indianapolis_vpc_public2_subnet" {
  value = aws_subnet.indianapolis_vpc_public2_subnet.id
}

output "indianapolis_vpc_private_subnet" {
  value = aws_subnet.indianapolis_vpc_private_subnet.id
}

output "indianapolis_vpc_private2_subnet" {
  value = aws_subnet.indianapolis_vpc_private2_subnet.id
}

output "indianapolis_vpc_database_subnet_0" {
  value = aws_subnet.indianapolis_vpc_database_subnet_0.id
}

output "indianapolis_vpc_database_subnet_1" {
  value = aws_subnet.indianapolis_vpc_database_subnet_1.id
}