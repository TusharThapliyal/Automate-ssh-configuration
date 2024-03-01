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
  provisioner "local-exec" {
    command     = templatefile("${var.host_os}-ssh-config.tpl", { hostname = self.public_ip, user = "ubuntu", identityfile = "~/.ssh/aws_key_pair" })
    interpreter = var.host_interpreter
  }
}
/* tamplatefile("just the file name", {variable used in the tpl file})

  provisioner are not tracked by state file. so if you add provisioner to your file it will not trigger any new changes or trigger terraform apply. 

  use terraform apply -replace <name of the resource>
  */
