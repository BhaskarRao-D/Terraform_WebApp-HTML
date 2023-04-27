resource "aws_instance" "Terraform_WebApp" {

  ami                    = "ami-0127b2e6f3b9b94d5"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_pair_app.key_name
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  tags = {
    Name = "Terraform_WebApp"
  }
}

output "no_output_bhaskar" {
  value       = aws_instance.Terraform_WebApp.id
  description = "No_Output_Found-Bhaskar"
}
