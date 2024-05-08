/*resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}*/

data "aws_vpc" "default" {
  default = true
}