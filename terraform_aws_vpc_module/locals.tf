locals {
  name = "${var.project_name}-${var.environment}"
  az_name = slice(data.aws_availability_zones.az_list.names,0,2)
}