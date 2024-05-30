variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "instance_profile" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "asg_desired" {
  type = string
}

variable "asg_max_size" {
  type = string
}

variable "asg_min_size" {
  type = string
}

variable "ebs_block_device" {
  type        = list(map(string))
  default     = []
}

variable "lb_security_group_id" {
  type = string
}
