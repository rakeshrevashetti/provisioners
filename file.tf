provider "aws" {
  region = "eu-west-1"
}   

resource "aws_instance" "file-server" {
    ami = ""
    instance_type = "t2.micro"
    tags = {
        Name = "my-file-server"
    }

    connection {
        type = "ssh"
        user = "ec2-user"
        host = self.public_ip
        private_key = file("~/.ssh/id_rsa")
    }
    
    provisioner "file" {
        source = "index.html"
        destination = "/var/www/html/index.html"
    }

  
}