resource "aws_instance" "public-instance" {
  #count                       = length(var.public_cidr_block)
  count                       = var.environment == "dev" ? 3 : 1
  ami                         = lookup(var.ami, var.aws_region)
  instance_type               = lookup(var.instance-type, var.environment)
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnet.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.dev-security-sg.id}"]
  associate_public_ip_address = true
  tags = {
    Name        = "${var.vpc_name}-public-server-${count.index + 1}"
    Owner       = local.Owner
    Costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }

}

resource "aws_instance" "private-instance" {
  count                       = length(var.private_cidr_block)
  ami                         = lookup(var.ami, var.aws_region)
  instance_type               = lookup(var.instance-type, var.environment)
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.private-subnet.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.dev-security-sg.id}"]
  associate_public_ip_address = false
  tags = {
    Name        = "${var.vpc_name}-private-server-${count.index}"
    Owner       = local.Owner
    Costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    environment = var.environment

  }
}