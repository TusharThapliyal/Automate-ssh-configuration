module "network" {
  source     = "./network"
  cidr_vpc   = var.cidr_vpc
  cidr_subet = var.cidr_subet
  az         = var.az
}
module "routeTable" {
  source         = "./routeTable"
  my_subnet_id   = module.network.my_subnet_id
  my_main_igw_id = module.network.my_main_igw_id
  my_main_vpc_id = module.network.my_main_vpc_id
}
