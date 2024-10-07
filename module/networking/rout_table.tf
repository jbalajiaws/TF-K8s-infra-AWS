resource "aws_route_table" "my_public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = local.rttags
}

resource "aws_main_route_table_association" "rt_vpc_association" {
  vpc_id         = aws_vpc.my_vpc.id
  route_table_id = aws_route_table.my_public_rt.id
}

resource "aws_route_table_association" "public_rt_association" {
  count = length(local.public_subnet_ids)

  subnet_id      = local.public_subnet_ids[count.index]
  route_table_id = aws_route_table.my_public_rt.id
  depends_on     = [aws_subnet.my_subnets]
}

