resource "aws_security_group" "my_sgs" {
  count  = length(var.security_group_config)
  name   = var.security_group_config[count.index].name
  vpc_id = aws_vpc.my_vpc.id

  # Inbound rules
  dynamic "ingress" {
    for_each = var.security_group_config[count.index].ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description

    }
  }

  # Outbound rules
  dynamic "egress" {
    for_each = var.security_group_config[count.index].egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }

  tags = {
    Name = var.security_group_config[count.index].name
  }
}