resource "aws_key_pair" "aws_auth" {
  key_name   = "aws_key_pair"
  public_key = file("~/.ssh/aws_key_pair.pub")
}
