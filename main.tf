resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

module "myapp-subnet" {
  source            = "./modules/subnet"
  env_prefix        = var.env_prefix
  vpc_id            = aws_vpc.myapp-vpc.id
  availability_zone = var.availability_zone
  subnet_cidr_block = var.subnet_cidr_block
}

module "myapp-server" {
  source              = "./modules/webserver"
  vpc_id              = aws_vpc.myapp-vpc.id
  image_name          = var.image_name
  instance_type       = var.instance_type
  my_ip               = var.my_ip
  subnet_id           = module.myapp-subnet.subnet.id
  env_prefix          = var.env_prefix
  availability_zone   = var.availability_zone
  public_key_location = var.public_key_location
}
