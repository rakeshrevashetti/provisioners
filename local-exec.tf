provider "aws" {
    region = "eu-west-1"
}

resource "aws_instance" "local-server" {
    ami = ""
    instance_type = "t2.micro"
    tags = {
        Name = "my-local-server"
    }
    provisioner "local-exec" {
        command = "echo ${aws_instance.local-server.public_ip} > ip_address.txt"
      
    }
  
}