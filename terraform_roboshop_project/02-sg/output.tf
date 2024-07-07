output "default_vpc" {
  value = data.aws_vpc.default.id
}

# output "aws_security_group" {
#   value = module.roboshop_sg.sg_id
# }

output "roboshop_vpc" {
  value = data.aws_vpc.roboshop_vpc.id
}