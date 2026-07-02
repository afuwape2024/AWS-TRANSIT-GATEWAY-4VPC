output "columbus_vpc" {
  value = aws_vpc.columbus_vpc.id
}

output "columbus_vpc_public_subnet" {
  value = aws_subnet.columbus_vpc_public_subnet.id
}

output "columbus_vpc_public2_subnet" {
  value = aws_subnet.columbus_vpc_public2_subnet.id
}

output "columbus_vpc_private_subnet" {
  value = aws_subnet.columbus_vpc_private_subnet.id
}

output "columbus_vpc_private2_subnet" {
  value = aws_subnet.columbus_vpc_private2_subnet.id
}

output "columbus_vpc_database_subnet_0" {
  value = aws_subnet.columbus_vpc_database_subnet_0.id
}

output "columbus_vpc_database_subnet_1" {
  value = aws_subnet.columbus_vpc_database_subnet_1.id
}