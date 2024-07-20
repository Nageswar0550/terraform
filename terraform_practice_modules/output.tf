output "private_ip" {
  value = aws_instance.EC2.private_ip
}

output "public_ip" {
  value = aws_instance.EC2.public_ip
}