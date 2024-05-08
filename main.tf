data "aws_ami" "linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}

resource "aws_instance" "jenkins_web" {
  ami           = data.aws_ami.linux.id
  instance_type = "t2.micro"
  user_data = file("jenkinsinstall.sh")
  tags = {
    Name = "12wt2mic"
  }
}