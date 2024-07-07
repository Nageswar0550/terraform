resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_eip" "main" {
  domain = "vpc"
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public_main[0].id
}

resource "aws_subnet" "public_main" {
  count                   = length(var.public_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_cidr[count.index]
  availability_zone       = local.az_list[count.index]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_main" {
  count             = length(var.private_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_cidr[count.index]
  availability_zone = local.az_list[count.index]
}

resource "aws_subnet" "database_main" {
  count             = length(var.database_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.database_cidr[count.index]
  availability_zone = local.az_list[count.index]
}

resource "aws_route_table" "public_rt_main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "private_rt_main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "database_rt_main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "public_route_main" {
  route_table_id         = aws_route_table.public_rt_main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route" "private_route_main" {
  route_table_id         = aws_route_table.private_rt_main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.main.id
}

resource "aws_route" "database_route_main" {
  route_table_id         = aws_route_table.database_rt_main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.main.id
}


resource "aws_route_table_association" "public_main" {
  count          = length(var.public_cidr)
  route_table_id = aws_route.public_route_main.id
  subnet_id      = aws_subnet.public_main[count.index].id
}

resource "aws_route_table_association" "private_main" {
  count          = length(var.private_cidr)
  route_table_id = aws_route.private_route_main.id
  subnet_id      = aws_subnet.private_main[count.index].id
}

resource "aws_route_table_association" "database_main" {
  count          = length(var.database_cidr)
  route_table_id = aws_route.database_route_main.id
  subnet_id      = aws_subnet.database_main[count.index].id
}