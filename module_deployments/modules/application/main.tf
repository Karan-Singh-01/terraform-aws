terraform {
  required_version = ">= 1.8.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.47.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*"] 
  }  
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"
  
  name = "my-alb"

  load_balancer_type = "application"

  vpc_id             = var.vpc_id
  subnets            = var.public_subnets
  security_groups    = [var.lb_security_group_id]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}

resource "aws_launch_template" "ec2_temp" {
  name = "application"

  image_id               = data.aws_ami.ami.id
  instance_type          = var.instance_type
  key_name               = var.key_name

  user_data = base64encode(<<-EOF
    #!/bin/bash

    sudo su 

    yum update -y  

    yum install httpd -y 

    systemctl start httpd

    systemctl enable httpd

    mkdir -p /var/www/html

echo '<!DOCTYPE html>
<html>

<head>
	<title>
		First Web Page
	</title>
</head>

<body>
	Hello World!
</body>

</html>' > /var/www/html/index.html
EOF
  )   

  iam_instance_profile {
    arn = var.instance_profile
  }

  network_interfaces {
    subnet_id                   = var.private_subnets[0]
    associate_public_ip_address = false
    delete_on_termination       = true 
    security_groups             = [var.security_group_id]
  }
}

resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = var.private_subnets

  desired_capacity = var.asg_desired
  max_size         = var.asg_max_size
  min_size         = var.asg_min_size

  target_group_arns = module.alb.target_group_arns

  launch_template {
    id      = aws_launch_template.ec2_temp.id
    version = "$Latest"
  }
}

data "aws_instances" "asg_instances" {
  instance_state_names = ["running", "stopped"]
}