provider "aws" {
  region = var.aws_region

}

terraform {
  backend "s3" {
    bucket = "kandasamy.in"
    key    = "dev.tfstate"
    region = "us-east-1"

  }
}

resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name        = var.vpc_name
    Owner       = local.Owner
    Costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}

#Internet_gatway
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
}








