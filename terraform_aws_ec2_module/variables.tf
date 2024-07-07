variable "aws_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_security_group_ids" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "common_tags" {
  type = map
  default = {}
}

variable "component" {
  type = string
}

variable "user_data" {
  type = string
  default = null
}