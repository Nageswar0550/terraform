#Creating VPC
resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.dns_hostnames

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = local.name
    }
  )
}

#Creating Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
      Name = local.name
    }
  )
  
}

#Public subnet in 2 availability zones
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block[count.index]
  map_public_ip_on_launch = true
  tags = merge(
    var.common_tags,
    var.public_subnet_tags,
    {
      Name = "${local.name}-public-${local.az_name[count.index]}"
    }
  )
  availability_zone = local.az_name[count.index]
}

#Private subnet in 2 availability zones
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block[count.index]
  tags = merge(
    var.common_tags,
    var.private_subnet_tags,
    {
      Name = "${local.name}-private-${local.az_name[count.index]}"
    }
  )
  availability_zone = local.az_name[count.index]
}

#Database subnet in 2 availability zones
resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr_block[count.index]
  tags = merge(
    var.common_tags,
    var.database_subnet_tags,
    {
      Name = "${local.name}-database-${local.az_name[count.index]}"
    }
  )
  availability_zone = local.az_name[count.index]
}

#Public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.public_rt_tags,
    {
      Name = "${local.name}-public"
    }
  )
}

#Private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.private_rt_tags,
    {
      Name = "${local.name}-private"
    }
  )
}

#Database route table
resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.database_rt_tags,
    {
      Name = "${local.name}-database"
    }
  )
}

#Associsting Public route table to both Public subnets
resource "aws_route_table_association" "public" {
  count = 2
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

#Associsting Private route table to both Private subnets
resource "aws_route_table_association" "private" {
  count = 2
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

#Associsting Database route table to both Database subnets
resource "aws_route_table_association" "database" {
  count = 2
  subnet_id = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.database.id
}

#Adding Public route with gateway as IGW
resource "aws_route" "public" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
  
}

#Adding Private route with gateway as NAT instance
resource "aws_route" "private" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id = aws_instance.nat.primary_network_interface_id
}

#Adding Database route with gateway as NAT instance
resource "aws_route" "database" {
  route_table_id = aws_route_table.database.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id = aws_instance.nat.primary_network_interface_id
}

#Creating NAT Instance
resource "aws_instance" "nat" {
  ami = data.aws_ami.nat.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public[0].id
  source_dest_check = true
}