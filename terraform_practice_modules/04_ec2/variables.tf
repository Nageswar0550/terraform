variable "common_tags" {
  default = {}
}

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "instance_names" {
  type = list
  default = []
}

variable "user_data" {
  default = ""
}

variable "instance_type" {
  type = string
}

variable "ec2_tags" {
  default = {}
}

variable "ami_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_id" {
  type = string
}

variable "component" {
  type = string
}

variable "iam_instance_profile" {
  type = string
  default = ""
}