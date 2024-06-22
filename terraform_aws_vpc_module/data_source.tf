data "aws_availability_zones" "az_list" {
  state = "available"
}

data "aws_ami" "nat" {
  most_recent = true
  filter {
    name   = "name"
    values = ["fck-nat-amzn2-hvm-*.*.*-x86_64-ebs"]
  }
  filter {
    name   = "owner-id"
    values = ["568608671756"]
  }
}