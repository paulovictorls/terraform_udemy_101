output "instance" {
  value = aws_instance.myapp-server
}

output "ami_image" {
  value = data.aws_ami.latest-amazon-linux-image
}
