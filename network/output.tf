output "my_main_vpc_id" {
  value = aws_vpc.my_main_vpc.id
}
output "my_main_igw_id" {
  value = aws_internet_gateway.my_main_igw.id
}
output "my_subnet_id" {
 value = aws_subnet.my_public_subet.id
}
