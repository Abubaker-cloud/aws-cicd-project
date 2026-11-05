data "aws_ssm_parameter" "ami" {

  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "web" {

  ami = data.aws_ssm_parameter.ami.value

  instance_type = var.instance_type

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash

              dnf update -y

              dnf install -y docker

              systemctl enable docker

              systemctl start docker

              usermod -aG docker ec2-user

              EOF

  user_data_replace_on_change = true

  root_block_device {

    volume_size = 12

    volume_type = "gp3"

    encrypted = true
  }

  tags = {
    Name = "${var.project_name}-web-server"
  }

  depends_on = [
    aws_iam_role_policy_attachment.ssm,
    aws_iam_role_policy_attachment.cloudwatch
  ]
}
