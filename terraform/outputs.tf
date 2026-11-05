output "vpc_id" {

  value = aws_vpc.main.id
}

output "public_subnet_id" {

  value = aws_subnet.public.id
}

output "ec2_instance_id" {

  value = aws_instance.web.id
}

output "ec2_public_ip" {

  value = aws_instance.web.public_ip
}

output "ec2_public_dns" {

  value = aws_instance.web.public_dns
}

output "ecr_repository_url" {

  value = aws_ecr_repository.app.repository_url
}
