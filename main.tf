terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/23"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-01"
  }
}

resource "aws_subnet" "main-public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-publica"
  }
}

resource "aws_subnet" "main-private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-privada"
  }
}

resource "aws_network_acl" "public_acl" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.main-public.id]

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    rule_no    = 200
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    rule_no    = 400
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 32000
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "acl-publica"
  }
}

resource "aws_network_acl" "private_acl" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.main-private.id]

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    rule_no    = 101
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    rule_no    = 200
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    rule_no    = 400
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 32000
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "acl-privada"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "igw"
  }
}

resource "aws_eip" "main-public" {
  vpc = true

  tags = {
    Name = "eip-natgw"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main-public.id
  subnet_id     = aws_subnet.main-public.id

  tags = {
    Name = "igw-nat"
  }
}

resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "rt-publica"
  }
}

resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "rt-privada"
  }
}

resource "aws_route_table_association" "main-public" {
  subnet_id      = aws_subnet.main-public.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-private" {
  subnet_id      = aws_subnet.main-private.id
  route_table_id = aws_route_table.main-private.id
}

resource "aws_security_group" "main" {
  name        = "main-sg"
  description = "main security group"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "main-public" {
  key_name   = "pbkey-ges"
  public_key = file("~/.ssh/pbkey-ges.pub")
}

resource "aws_key_pair" "main-private" {
  key_name   = "pvkey-ges"
  public_key = file("~/.ssh/pvkey-ges.pub")
}

resource "aws_instance" "main-public" {
  ami                         = "ami-04b4f1a9cf54c11d0"
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  provisioner "remote-exec" {

    inline = [
      "echo '${file("setup_public_instance.sh")}' > /tmp/setup_public_instance.sh",
      "chmod +x /tmp/setup_public_instance.sh",
      "bash /tmp/setup_public_instance.sh ${self.public_ip}"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"  
      private_key = file("~/.ssh/pbkey-ges")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "instancia-publica"
  }

  key_name        = aws_key_pair.main-public.key_name
  security_groups = [aws_security_group.main.id]
  subnet_id       = aws_subnet.main-public.id
}


data "template_file" "back-conf" {
  template = file("${path.module}/application.properties.tpl")

  vars = {
    ipv4_public = aws_instance.main-public.public_ip
  }
}

resource "local_file" "application_properties" {
  content  = data.template_file.back-conf.rendered
  filename = "${path.module}/application.properties"
}


resource "aws_instance" "main-private" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  private_ip = "10.0.1.253"

  # user_data = ""

  tags = {
    Name = "instancia-privada"
  }

  key_name        = aws_key_pair.main-private.key_name
  security_groups = [aws_security_group.main.id]
  subnet_id       = aws_subnet.main-private.id
}
