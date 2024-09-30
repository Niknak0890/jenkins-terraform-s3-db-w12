resource "aws_default_security_group" "default" {
  vpc_id = data.aws_vpc.default.id

  tags = {
    Name = "allow_jenkins_ssh"
  }

  egress {
    description = "allow all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow http/jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #Cidr blocks needed if calling ing/egress w/o resource block
  ##IF using a default vpc, best practice is to edit the default sg rather than creating a new one :)
}