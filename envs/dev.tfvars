# Nomes das chaves
pvkey_name = "pvkey-ges"
pbkey_name = "pbkey-ges"

# Valores das instâncias
ami = "ami-04b4f1a9cf54c11d0"   
bastion_instance_type = "t2.micro"
private_instance_type = "t2.micro"

# Configurações da VPC
vpc_cidr_block = "10.0.0.0/23"
public_subnet_cidr = "10.0.0.0/24"
private_subnet_cidr = "10.0.1.0/24"

# Configurações da ACL

public_acl = [
  {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
    direction = "ingress"
  },
  {
    rule_no    = 200
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
    direction = "ingress"
  },
  {
    rule_no    = 201
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8080
    to_port    = 8080
    direction = "ingress"
  },
  {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
    direction = "ingress"
  },
  {
    rule_no    = 400
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 32000
    to_port    = 65535
    direction = "ingress"
  },
  {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    direction = "egress"
  }
]

private_acl = [
  {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.0.0.0/24"
    from_port  = 22
    to_port    = 22
    direction = "ingress"
  },
  {
    rule_no    = 200
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.0.0.0/24"
    from_port  = 80
    to_port    = 80
    direction = "ingress"
  },
  {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.0.0.0/24"
    from_port  = 443
    to_port    = 443
    direction = "ingress"
  },
  {
    rule_no    = 301
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.0.0.0/24"
    from_port  = 3306
    to_port    = 3306
    direction = "ingress"
  },
  {
    rule_no    = 302
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.0.0.0/24"
    from_port  = 8080
    to_port    = 8080
    direction = "ingress"
  },
  {
    rule_no    = 400
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 32000
    to_port    = 65535
    direction = "ingress"
  },
  {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    direction = "egress"
  }
]
