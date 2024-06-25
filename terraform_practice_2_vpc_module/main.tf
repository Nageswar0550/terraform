resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
        Name = "${var.project_name}-${var.environment}"
    }
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
        Name = "${var.project_name}-${var.environment}"
    }
  )
}

resource "aws_subnet" "public" {
  count = length(local.az_list)
  vpc_id = aws_vpc.main.id
  availability_zone = local.az_list[count.index]
  map_public_ip_on_launch = true
  cidr_block = "${var.public_cidr[count.index]}"

  tags = merge(
    var.common_tags,
    var.subnet_tags,
    {
        Name = "${var.project_name}-${var.environment}-public-${local.az_list[count.index]}"
    }
  )
}

resource "aws_subnet" "private" {
  count = length(local.az_list)
  vpc_id = aws_vpc.main.id
  availability_zone = local.az_list[count.index]
  cidr_block = "${var.private_cidr[count.index]}"
  
  tags = merge(
    var.common_tags,
    var.subnet_tags,
    {
        Name = "${var.project_name}-${var.environment}-private-${local.az_list[count.index]}"
    }
  )
}

resource "aws_subnet" "database" {
  count = length(local.az_list)
  vpc_id = aws_vpc.main.id
  availability_zone = local.az_list[count.index]
  cidr_block = "${var.database_cidr[count.index]}"
  
  tags = merge(
    var.common_tags,
    var.subnet_tags,
    {
        Name = "${var.project_name}-${var.environment}-database-${local.az_list[count.index]}"
    }
  )
}