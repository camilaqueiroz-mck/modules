variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Vpc cidr block"
}

variable "subnet_public_cidr_blocks" {
  type        = list(string)
  description = "Subnets publics cidr block"
}

variable "subnet_private_cidr_blocks" {
  type        = list(string)
  description = "Subnets privates block"
}

variable "azs" {
  type        = list(string)
  description = "Zonas de disponibilidade da AWS"
}

variable "env" {
  type        = string
  description = "Enviroment"
}