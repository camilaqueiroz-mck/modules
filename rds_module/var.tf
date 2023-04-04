variable "db_username" {
  type        = string
  description = "db username"
}

variable "db_password" {
  type        = string
  description = "db password"
}

# variable "eks_sec_group_id" {
#   type        = string
#   description = "security group do cluster"
# }

variable "private_subnet_ids" {
  type        = list(string)
  description = "id das privates subnets"
}

variable "env" {
  type        = string
  description = "enviroment"
}

variable "vpc_id" {
  type        = string
  description = "id da vpc"
}