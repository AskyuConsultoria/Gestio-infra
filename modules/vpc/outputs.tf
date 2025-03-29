output "public_subnet_id" {
    value = aws_subnet.main-public.id 
}

output "private_subnet_id" {
    value = aws_subnet.main-private.id 
}

output "security_group_id" {
    value = aws_security_group.main.id
}