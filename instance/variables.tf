variable "instance_type" {
  type = string
}
variable "aws_auth" {
  type = string
}
variable "sg_id" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "user_data" {
  type = string
}
variable "host_os" {
  type = string
}
variable "host_interpreter" {
  type = list(string)
}
