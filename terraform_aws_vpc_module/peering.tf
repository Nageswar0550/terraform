resource "aws_vpc_peering_connection" "main" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = "${var.requester_vpc_id}" == "" ? "${data.aws_vpc.default_vpc.id}" : "${var.requester_vpc_id}"
  auto_accept = var.requester_vpc_id == "" ? true : false

  tags = merge(
    var.common_tags,
    var.peering_tags,
    {
        Name = "${var.project_name}-${var.environment}"
    }
  )
}

resource "aws_route" "default_roboshop_vpc" {
  count = var.is_peering_required && var.requester_vpc_id == "" ? 1 : 0
  destination_cidr_block = var.cidr_block
  route_table_id = data.aws_route_table.default_route_table.id
  vpc_peering_connection_id = aws_vpc_peering_connection.main[0].id
}

resource "aws_route" "public_default" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = data.aws_vpc.default_vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[0].id
}

resource "aws_route" "private_default" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = data.aws_vpc.default_vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[0].id
}

resource "aws_route" "database_default" {
  route_table_id = aws_route_table.database.id
  destination_cidr_block = data.aws_vpc.default_vpc.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[0].id
}