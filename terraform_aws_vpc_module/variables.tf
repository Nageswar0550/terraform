variable "cidr_block" {
  type = string
}

variable "dns_hostnames" {
  type    = bool
  default = true
}

variable "common_tags" {
  type    = map
  default = {}
}

variable "vpc_tags" {
  type    = map
  default = {}
}

variable "igw_tags" {
  type    = map
  default = {}
}

variable "public_subnet_tags" {
  type    = map
  default = {}
}

variable "private_subnet_tags" {
  type    = map
  default = {}
}

variable "database_subnet_tags" {
  type    = map
  default = {}
}

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "public_subnet_cidr_block" {
  type = list
  validation {
    condition = length(var.public_subnet_cidr_block) == 2
    error_message = "You should only provide 2 subnets" 
  }
}

variable "private_subnet_cidr_block" {
  type = list
  validation {
    condition = length(var.private_subnet_cidr_block) == 2
    error_message = "You should only provide 2 subnets" 
  }
}

variable "database_subnet_cidr_block" {
  type = list
  validation {
    condition = length(var.database_subnet_cidr_block) == 2
    error_message = "You should only provide 2 subnets" 
  }
}

variable "public_rt_tags" {
  type = map
  default = {}
}

variable "private_rt_tags" {
  type = map
  default = {}
}

variable "database_rt_tags" {
  type = map
  default = {}
}