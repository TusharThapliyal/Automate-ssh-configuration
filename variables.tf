variable "region" {
  type        = string
  description = "deafult region of aws"
}
variable "cidr_vpc" {
  type = string
}
variable "cidr_subet" {
  type = string
}
variable "az" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "host_os" {
  type = string
}
variable "host_interpreter" {
  type = list(string)
}
