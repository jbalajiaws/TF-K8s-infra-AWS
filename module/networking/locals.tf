locals {
  vpc_tags = {
    Name = join("_", [var.env, "vpc"])

  }
  igwtags = {
    Name = join("_", [var.env, "igw"])

  }

  rttags = {
    Name : join("_", [var.env, "public_rout_table"])
  }

  nattags = {
    Name : join("_", [var.env, "nat_gatway"])
  }
  private_rt_tags = {
    Name : join("_", [var.env, "private_rout_table"])
  }

  #  subnets_tags = {
  #    Name = join(
  #      "-",
  #      [
  #        var.env,
  #        var.subnet_config[count.index].map_public_ip_on_launch ? "public" : "private",
  #        "subnet",
  #        tostring(count.index + 1) # Increment the index to start from 1
  #      ]
  #    )
  #    # Other tags...
  #  }
  public_subnet_ids  = [for subnet in aws_subnet.my_subnets : subnet.id if subnet.map_public_ip_on_launch == true]
  private_subnet_ids = [for subnet in aws_subnet.my_subnets : subnet.id if subnet.map_public_ip_on_launch == false]

  # Separate lists for public and private subnets based on map_public_ip_on_launch
  public_subnets  = [for s in var.subnet_config : s if s.map_public_ip_on_launch]
  private_subnets = [for s in var.subnet_config : s if !s.map_public_ip_on_launch]
}