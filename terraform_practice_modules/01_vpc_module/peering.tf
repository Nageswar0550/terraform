resource "aws_vpc_peering_connection" "roboshop" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = "${var.requester_vpc_id}" == "" ? "${data.aws_vpc.default.id}" : "${var.requester_vpc_id}"
  auto_accept = var.requester_vpc_id == "" ? true : false
  tags = merge(
    var.common_tags,
    var.peering_tags,
    {
      Name = "${var.project_name}-${var.environment}"
    }
  )
}

resource "aws_route" "default_roboshop" {
  count = "${var.is_peering_required}" ? 1 : 0
  route_table_id            = data.aws_route_table.default.id
  destination_cidr_block    = "${var.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.roboshop[0].id}"
}

resource "aws_route" "rb_public_default" {
  count = "${var.is_peering_required}" ? 1 : 0
  route_table_id            = aws_route_table.public_rt_main.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = "${aws_vpc_peering_connection.roboshop[0].id}"
}

resource "aws_route" "rb_private_default" {
  count = "${var.is_peering_required}" ? 1 : 0
  route_table_id            = aws_route_table.private_rt_main.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = "${aws_vpc_peering_connection.roboshop[0].id}"
}

resource "aws_route" "rb_database_default" {
  count = "${var.is_peering_required}" ? 1 : 0
  route_table_id            = aws_route_table.database_rt_main.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = "${aws_vpc_peering_connection.roboshop[0].id}"
}