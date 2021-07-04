variable "vpc_cidr_block" {
  default = "10.10.0.0/16"
}

variable "public_subnet" {
  default = "10.10.11.0/24"
}

variable "private_subnet" {
  default = "10.10.10.0/24"
}

variable "nat_gw_subnet" {
  default = "10.10.9.0/24"
}

variable "env" {
  default = ""
}

variable "az" {
  default = ""
}
