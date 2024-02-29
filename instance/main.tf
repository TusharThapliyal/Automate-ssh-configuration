resource "aws_instance" "web-server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "web-server"
  }
  key_name               = var.aws_auth
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.subnet_id

  root_block_device {
    volume_size = 10
  }
}
