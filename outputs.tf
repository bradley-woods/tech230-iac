# Outputs
# -------
# Show EC2 App Instance Public IPv4 Address
output "app_public_ip" {
  value = aws_instance.app_instance.public_ip
}

# Show EC2 DB Instance Private IPv4 Address
output "db_private_ip" {
  value = aws_instance.db_instance.private_ip
}