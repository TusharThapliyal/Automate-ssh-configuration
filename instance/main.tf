resource "aws_instance" "web-server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.aws_auth
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.subnet_id
  user_data              = var.user_data
  root_block_device {
    volume_size = 10
  }
  tags = {
    Name = "web-server"
  }
}
