aws_region         = "us-east-1"
vpc_cidr           = "172.18.0.0/16"
vpc_name           = "Kandasamy-VPC"
key_name           = "kops-key"
azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
environment        = "prod"
public_cidr_block  = ["172.18.1.0/24", "172.18.2.0/24", "172.18.3.0/24", "172.18.4.0/24", "172.18.5.0/24", "172.18.6.0/24"]
private_cidr_block = ["172.18.10.0/24", "172.18.20.0/24", "172.18.30.0/24", "172.18.40.0/24", "172.18.50.0/24", "172.18.60.0/24"]
Public_RT          = "dev-route-table-public"
Private_RT         = "dev-route-table-private"
ingress_value      = ["80", "443", "8080", "8443", "22", "3306", "1900", "1443"]
ami = {
  us-east-1 = "ami-084568db4383264d4"
}

instance-type = {
  dev  = "t2.micro"
  prod = "t3.micro"
}