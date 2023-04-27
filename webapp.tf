resource "null_resource" "configuration_resource" {

  connection {
    type     = "ssh"
    user     = "root"
    password = aws_key_pair.key_pair_app.key_name
    host     = aws_instance.Terraform_WebApp.public_ip
  }

  provisioner "remote-exec" {

    inline = [
      "sudo su -",
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl status httpd",
      "sudo mkfs.ext4 /dev/sdh",
      "sudo mount /dev/sdh /var/www/html",
      "sudo yum install git -y",
      "sudo git clone https://github.com/BhaskarRao-D/Terraform_WebApp.git /var/www/html/index.html"
    ]
  }
}



