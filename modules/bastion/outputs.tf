output "bastion_public_ip" {
    value = aws_instance.main-public.public_ip
}