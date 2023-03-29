output "vpc_id" {
  value = aws_vpc.vpc_default.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet_default.*.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet_default.*.id
}
