variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type = string
  default = "true"
}

variable "common_tags" {
  type = map
  default = {
    Terraform = true
  }
}

variable "vpc_tags" {
  type = map
  default = {}
}

variable "igw_tags" {
  type = map
  default = {}
}

variable "subnet_tags" {
  type = map
  default = {}
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "deploy_in_az" {
  type = string
}

variable "public_cidr" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_cidr" {
  type = list
  default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "database_cidr" {
  type = list
  default = ["10.0.21.0/24","10.0.22.0/24"]
}