output "public_ip" {
  value = aws_instance.jenkins_web.public_ip
}

output "ssh" {
  value = "ssh -i ${local_file.ssh_key.filename} ec2-user@${aws_instance.jenkins_web.public_ip}"
}