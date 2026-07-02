output "central-transit-gateway" {
  value = aws_ec2_transit_gateway.central-transit-gateway.id
}

output "detroit_transit_vpc" {
  value = aws_ec2_transit_gateway_vpc_attachment.detroit_transit_vpc.id
}
output "chicago_transit_vpc" {
  value = aws_ec2_transit_gateway_vpc_attachment.chicago_transit_vpc.id
}
output "columbus_transit_vpc" {
  value = aws_ec2_transit_gateway_vpc_attachment.columbus_transit_vpc.id
}
output "indianapolis_transit_vpc" {
  value = aws_ec2_transit_gateway_vpc_attachment.indianapolis_transit_vpc.id
}
