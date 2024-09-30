# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "my_ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create the Key Pair
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "w10key"
  public_key = tls_private_key.my_ec2_key.public_key_openssh
}

# Save key pair to current working directory
resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.ec2_key_pair.key_name}.pem"
  content  = tls_private_key.my_ec2_key.private_key_pem
}

#### NEW CODE TO TRY TO CHMOD KEY PAIR 
resource "null_resource" "set_permissions" {
  provisioner "local-exec" {
    command = "chmod 400 w10key.pem" # may need to add the path to the file if doesn't work
  }

  # This will ensure the resource is created after the key file exists
  triggers = {
    key_file = file("w10key.pem") # may need to add the path to the file if doesn't work
  }
}

