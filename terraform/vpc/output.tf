output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_zone1.id,
    aws_subnet.private_zone2.id
  ]
}