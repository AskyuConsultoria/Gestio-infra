resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-01"
  }
}

resource "aws_subnet" "main-public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-publica"
  }
}

resource "aws_subnet" "main-private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr 

  tags = {
    Name = "subnet-privada"
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


resource "aws_network_acl" "public_acl" {
  vpc_id = aws_vpc.main.id

  subnet_ids = [aws_subnet.main-public.id]

    ingress {
    rule_no    = 1
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

#   ingress {
#     rule_no    = 100
#     protocol   = "tcp"
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 22
#     to_port    = 22
#   }

#   ingress {
#     rule_no    = 200
#     protocol   = "tcp"
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 80
#     to_port    = 80
#   }

#   ingress {
#     rule_no    = 201
#     protocol   = "tcp"
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 8080
#     to_port    = 8080
#   }

#   ingress {
#     rule_no    = 300
#     protocol   = "tcp"
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 443
#     to_port    = 443
#   }

#   ingress {
#     rule_no    = 400
#     protocol   = "tcp"
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 32000
#     to_port    = 65535
#   }

  egress {
    rule_no    = 500
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_network_acl" "private_acl" {
  vpc_id = aws_vpc.main.id

  subnet_ids = [aws_subnet.main-private.id]

   ingress {
    rule_no    = 1
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

#   ingress {
#     rule_no    = 100
#     protocol   = "tcp"
#     action     = "allow"
#     cidr_block = "10.0.0.0/24"
#     from_port  = 22
#     to_port    = 22
#   }

#   ingress {
#     rule_no    = 200
#     protocol   = "tcp"
#     action     = "allow"
#     cidr_block = "10.0.0.0/24"
#     from_port  = 80
#     to_port    = 80
#   }

#   ingress {
#     rule_no    = 300
#     protocol   = "tcp"
#     action     = "allow"
#     cidr_block = "10.0.0.0/24"
#     from_port  = 443
#     to_port    = 443
#   }

#   ingress {
#     rule_no    = 301
#     protocol   = "tcp"
#     action     = "allow"
#     cidr_block = "10.0.0.0/24"
#     from_port  = 3306
#     to_port    = 3306
#   }

#   ingress {
#     rule_no    = 302
#     protocol   = "tcp"
#     action     = "allow"
#     cidr_block = "10.0.0.0/24"
#     from_port  = 8080
#     to_port    = 8080
#   }

#   ingress {
#     rule_no    = 400
#     protocol   = "tcp"
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 32000
#     to_port    = 65535
#   }

  egress {
    rule_no    = 500
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}
