module "network" {
  source     = "./network"
  cidr_vpc   = var.cidr_vpc
  cidr_subet = var.cidr_subet
  az         = var.az
}
module "routeTable" {
  source       = "./routeTable"
  my_subnet_id = module.network.my_subnet_id
  my_igw_id    = module.network.my_igw_id
  my_vpc_id    = module.network.my_vpc_id
}
module "securityGroup" {
  source    = "./securityGroup"
  my_vpc_id = module.network.my_vpc_id
}
module "instance" {
  source        = "./instance"
  instance_type = var.instance_type
  aws_auth      = module.awsKeyPair.key_id
  sg_id         = module.securityGroup.sg_id
  subnet_id     = module.network.my_subnet_id
  ami_id        = module.ami.ami_id
  user_data     = templatefile("./userdata/user-data.tpl", {})
}
module "awsKeyPair" {
  source = "./awsKeyPair"
}
module "ami" {
  source = "./ami"
}
