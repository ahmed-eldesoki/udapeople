
provider "aws" {
    region = "eu-central-1"
}
resource "aws_security_group" "allow_traffic" {
  name        = "allow_traffic"
  description = "Allow traffic fpr app"
  vpc_id      = "vpc-06a09fee1640ec894"

  ingress {
   
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
 
    from_port        = 3030
    to_port          = 3030
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {

    from_port        = 9100
    to_port          = 9100
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0d118c6e63bcb554e"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_traffic.id]
  subnet_id = "subnet-0f996d162c75c1e98"
  tags = {
    Name = "backend-${var.ID}"
  }
}