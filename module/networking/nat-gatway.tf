resource "aws_eip" "my_eip" {
  count  = length([for subnet in var.subnet_config : subnet if subnet.map_public_ip_on_launch == true]) > 0 ? 1 : 0
  domain = "vpc"

}

resource "aws_nat_gateway" "my_nat" {
  count         = length(local.public_subnet_ids) > 0 ? 1 : 0
  allocation_id = aws_eip.my_eip[count.index].id
  subnet_id     = local.public_subnet_ids[count.index]
  tags          = local.nattags
}


resource "aws_route_table" "my_private_rt" {
  vpc_id = aws_vpc.my_vpc.id
  tags   = local.private_rt_tags

}
resource "aws_route" "private_route" {
  count = length(local.private_subnet_ids) > 0 ? 1 : 0

  route_table_id         = aws_route_table.my_private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.my_nat[count.index].id
  #depends_on             = [aws_nat_gateway.my_nat]
}

resource "aws_route_table_association" "private_rt_association" {
  count = length(local.private_subnet_ids)

  subnet_id      = local.private_subnet_ids[count.index]
  route_table_id = aws_route_table.my_private_rt.id
  #depends_on     = [aws_nat_gateway.my_nat]
}

