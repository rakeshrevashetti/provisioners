provider "aws" {
    region = "eu-west-1"
}

resource "aws_instance" "remote-server" {
    ami = ""
    instance_type = "t2.micro"
    tags = {
        Name = "my-remote-server"
    }
    connection {
        type = "ssh"
        user = "ec2-user"
        host = self.public_ip
        private_key = file("~/.ssh/id_rsa")
    }
    provisioner "remote-exec" {
        inline = [
            "sudo yum install -y httpd",
            "sudo systemctl start httpd",
            "sudo systemctl enable httpd",
            "sudo echo 'Hello World' > /var/www/html/index.html"
        ]
      
    }
    
  
}