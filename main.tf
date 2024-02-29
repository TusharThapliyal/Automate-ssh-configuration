module "network" {
  source     = "./network"
  cidr_vpc   = var.cidr_vpc
  cidr_subet = var.cidr_subet
  az         = var.az
}
