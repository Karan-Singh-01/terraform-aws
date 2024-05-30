variable "cidr_block" {
  type    = string
  default = "10.20.0.0/16"
}

variable "availability_zones" {
  type = list(string)
}