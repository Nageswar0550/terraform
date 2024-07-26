output "az_names" {
  value = data.aws_availability_zones.az.names
}

output "public_subnet_id" {
  value = aws_subnet.public_main[*].id
}

output "private_subnet_id" {
  value = aws_subnet.private_main[*].id
}

output "database_subnet_id" {
  value = aws_subnet.database_main[*].id
}