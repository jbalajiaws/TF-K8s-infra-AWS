
resource "aws_subnet" "my_subnets" {
  count                   = length(var.subnet_config)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_config[count.index].cidr_block
  map_public_ip_on_launch = var.subnet_config[count.index].map_public_ip_on_launch
  availability_zone       = var.subnet_config[count.index].availability_zone
  tags = {
    Name = join(
      "_",
      [
        var.env,
        var.subnet_config[count.index].map_public_ip_on_launch ? "public" : "private",
        "subnet",
        tostring(
          var.subnet_config[count.index].map_public_ip_on_launch
          ? index(local.public_subnets, var.subnet_config[count.index]) + 1
          : index(local.private_subnets, var.subnet_config[count.index]) + 1
        ) # Increment the index based on public or private
      ]
    )
    # Other tags...
  }
  #depends_on              = [aws_vpc.my_vpc]
}
