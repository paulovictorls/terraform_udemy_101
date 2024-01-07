output "ec2_public_ip" {
    value = module.myapp-server.instance.public_ip
}

output "aws_ami_id" {
    value = module.myapp-server.ami_image.id
}