#create web server ec2 
resource "aws_instance" "public_server" {
  ami     = var.image_id
  instance_type = var.instance_type
  subnet_id = var.detroit_vpc_public_subnet
  vpc_security_group_ids = [var.detroit_public_sg_id]
  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "Detroit Web Server"
  }
}

resource "aws_instance" "app_server" {
  ami     = var.image_id
  instance_type = var.instance_type
  subnet_id = var.detroit_vpc_app_subnet
  vpc_security_group_ids = [var.detroit_app_sg_id]
  user_data = file("${path.module}/user_data.sh")
  key_name = var.key_pair_name

  tags = {
    Name = "Detroit App Server"
  }
}
