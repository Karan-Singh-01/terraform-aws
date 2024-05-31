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

resource "aws_iam_instance_profile" "ssm_profile" {
  role = "${aws_iam_role.iam_role.name}"
}

resource "aws_iam_role" "iam_role" {
  name               = "test_role"
  path               = "/"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "iam_policy" {
  name   = "iam_policy"
  policy = jsonencode(
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": [
            "ec2-instance-connect:SendSSHPublicKey",
            "ec2:Describe*"
          ],
          "Effect": "Allow",
          "Resource": "*"
        }
      ]
    }
  )
}

resource "aws_iam_policy_attachment" "iam_policy_attachment" {
  name       = "iam_policy_attachment"
  roles      = [aws_iam_role.iam_role.name]
  policy_arn = aws_iam_policy.iam_policy.arn
}
