resource "aws_instance" "main-private" {
  ami           = var.ami
  instance_type = var.private_instance_type
  key_name        = var.pvkey_name
  security_groups = var.security_groups
  subnet_id       = var.private_subnet_id 

  tags = {
    Name = "instancia-privada"
  }

}
