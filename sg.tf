# This SG handles the traffic for a particular vpc, in this case app-vpc
resource "aws_security_group" "sg" {
  name        = "allow_ssh_http"
  description = "Allow ssh http inbound traffic"
  vpc_id      = aws_vpc.app_vpc.id

  ingress {
    description      = "SSH from VPC"

    # allowing incoming traffic to a specific port range, 22-22 (SSH) 
    from_port        = 22
    to_port          = 22

    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    description      = "HTTP from VPC"

    # allowing incoming traffic to a specific port range, 80-80 (HTTP) 
    from_port        = 80
    to_port          = 80

    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  egress {

# allowing outgoing traffic from all ports (0-0)
    from_port        = 0
    to_port          = 0

    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}