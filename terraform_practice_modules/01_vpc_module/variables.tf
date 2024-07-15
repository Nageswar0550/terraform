variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_cidr" {
  type    = list(any)
  default = ["10.0.1.0/24", "10.0.11.0/24"]
}

variable "private_cidr" {
  type    = list(any)
  default = ["10.0.2.0/24", "10.0.12.0/24"]
}

variable "database_cidr" {
  type    = list(any)
  default = ["10.0.3.0/24", "10.0.13.0/24"]
}

variable "common_tags" {
  default = {}
}

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc_tags" {
  default = {}
}

variable "private_subnet_tags" {
  default = {}
}

variable "public_subnet_tags" {
  default = {}
}

variable "database_subnet_tags" {
  default = {}
}

variable "public_rt_tags" {
  default = {}
}

variable "private_rt_tags" {
  default = {}
}

variable "database_rt_tags" {
  default = {}
}