output "vpc_id" {
  value = aws_vpc.main.id
}

output "az" {
  value = local.az_name
}

output "public_subnet_id" {
  value = aws_subnet.public[*].id
}

output "private_subnet_id" {
  value = aws_subnet.private[*].id
}

output "database_subnet_id" {
  value = aws_subnet.database[*].id
}

output "default_vpc_id" {
  value = data.aws_vpc.default_vpc.id
}