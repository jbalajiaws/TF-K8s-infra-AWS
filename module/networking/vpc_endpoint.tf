resource "aws_vpc_endpoint" "my_vpc_endpint" {
  count               = length(var.vpc_endpoint_config)
  vpc_id              = aws_vpc.my_vpc.id
  service_name        = var.vpc_endpoint_config[count.index].service_name
  vpc_endpoint_type   = var.vpc_endpoint_config[count.index].vpc_endpoint_type
  private_dns_enabled = var.vpc_endpoint_config[count.index].private_dns_enabled

  # Only set route_table_ids for Gateway type
  route_table_ids = var.vpc_endpoint_config[count.index].vpc_endpoint_type == "Gateway" ? var.vpc_endpoint_config[count.index].route_table_ids : null

  # Only set subnet_ids for Interface or Gateway Load Balancer types
  subnet_ids = var.vpc_endpoint_config[count.index].vpc_endpoint_type != "Gateway" ? var.vpc_endpoint_config[count.index].subnet_ids : null

  # Only set security_group_ids for Interface or Gateway Load Balancer types
  security_group_ids = var.vpc_endpoint_config[count.index].vpc_endpoint_type != "Gateway" ? var.vpc_endpoint_config[count.index].security_group_ids : null


  tags = var.vpc_endpoint_config[count.index].tags
}
