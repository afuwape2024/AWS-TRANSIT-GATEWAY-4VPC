output "central-transit-gateway" {
  value = aws_ec2_transit_gateway.central-transit-gateway.id
}

output "central_transit_gateway" {
  value = aws_ec2_transit_gateway.central-transit-gateway.id
}

output "detroit_transit_vpc" {
  value = aws_ec2_transit_gateway_vpc_attachment.detroit_transit_vpc.id
}

output "detroit_transit_gateway_route_table" {
  value = aws_ec2_transit_gateway_route_table.detroit_transit_gateway_route_table.id
}

output "detroit_transit_gateway_route_table_association" {
  value = aws_ec2_transit_gateway_route_table_association.detroit_transit_gateway_route_table_association.id
}

output "detroit_transit_gateway_route_table_propagation" {
  value = aws_ec2_transit_gateway_route_table_propagation.detroit_transit_gateway_route_table_propagation.id
}

output "chicago_transit_vpc" {
  value = aws_ec2_transit_gateway_vpc_attachment.chicago_transit_vpc.id
}

output "chicago_transit_gateway_route_table" {
  value = aws_ec2_transit_gateway_route_table.chicago_transit_gateway_route_table.id
}

output "chicago_transit_gateway_route_table_association" {
  value = aws_ec2_transit_gateway_route_table_association.chicago_transit_gateway_route_table_association.id
}

output "chicago_transit_gateway_route_table_propagation" {
  value = aws_ec2_transit_gateway_route_table_propagation.chicago_transit_gateway_route_table_propagation.id
}

output "columbus_transit_vpc" {
  value = aws_ec2_transit_gateway_vpc_attachment.columbus_transit_vpc.id
}

output "columbus_transit_gateway_route_table" {
  value = aws_ec2_transit_gateway_route_table.columbus_transit_gateway_route_table.id
}

output "columbus_transit_gateway_route_table_association" {
  value = aws_ec2_transit_gateway_route_table_association.columbus_transit_gateway_route_table_association.id
}

output "columbus_transit_gateway_route_table_propagation" {
  value = aws_ec2_transit_gateway_route_table_propagation.columbus_transit_gateway_route_table_propagation.id
}

output "indianapolis_transit_vpc" {
  value = aws_ec2_transit_gateway_vpc_attachment.indianapolis_transit_vpc.id
}

output "indianapolis_transit_gateway_route_table" {
  value = aws_ec2_transit_gateway_route_table.indianapolis_transit_gateway_route_table.id
}

output "indianapolis_transit_gateway_route_table_association" {
  value = aws_ec2_transit_gateway_route_table_association.indianapolis_transit_gateway_route_table_association.id
}

output "indianapolis_transit_gateway_route_table_propagation" {
  value = aws_ec2_transit_gateway_route_table_propagation.indianapolis_transit_gateway_route_table_propagation.id
}
