#Route_Table_Public
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name        = var.Public_RT
    Owner       = local.Owner
    Costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}

#Route_Table_Private - without attaching IGW

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name        = var.Private_RT
    Owner       = local.Owner
    Costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}


#Route_Table_association_pulic_subnet

resource "aws_route_table_association" "public-subnet" {
  #count          = 4
  count          = length(var.public_cidr_block)
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

#Route_Table_association_private_subnet

resource "aws_route_table_association" "private-subnet" {
  #count          = 4
  count          = length(var.private_cidr_block)
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}