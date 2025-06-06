#Public_Subnet
resource "aws_subnet" "public-subnet" {
  #count             = 4
  count             = length(var.public_cidr_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.public_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-public-subnet-${count.index + 1}"
    Owner       = local.Owner
    Costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}

#Private_Subnet
resource "aws_subnet" "private-subnet" {
  #count             = 4
  count             = length(var.private_cidr_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.private_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-private-subnet-${count.index + 1}"
    Owner       = local.Owner
    Costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}