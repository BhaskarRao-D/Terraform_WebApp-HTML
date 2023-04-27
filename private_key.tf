resource "tls_private_key" "instance_key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "key_pair_app" {
  key_name   = "Terraform_WebApp"
  public_key = tls_private_key.instance_key.public_key_openssh
}
