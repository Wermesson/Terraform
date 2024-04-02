variable "cidr_vpc" {
  description = "cid para vpc criada na aws"
  type = string
}

variable "cidr_subnet" {
  description = "cidr para subnet criada"
  type = string
}

variable "environment" {
  description = "ambiente a que pertencem"
  type = string
}