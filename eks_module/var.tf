# variable "subnets_public_ids" {
#   type        = list(string)
#   description = "Subnets publics ids"
# }

variable "subnets_private_ids" {
  type        = list(string)
  description = "Subnets private ids"
}

variable "env" {
  type        = string
  description = "enviroment"
}