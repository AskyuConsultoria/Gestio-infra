resource "aws_instance" "main-public" {
  ami                         = var.ami
  instance_type               = var.bastion_instance_type
  associate_public_ip_address = true
  key_name        = var.pbkey_name
  security_groups = var.security_groups
  subnet_id       = var.public_subnet_id 

  tags = {
    Name = "instancia-publica"
  }
}