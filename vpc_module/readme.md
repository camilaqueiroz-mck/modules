# vpc-module
Terraform module to create an AWS ECR resource. In case you do not have terraform installed yet, the details of the terraform installation can be found in the [official documentation](https://www.terraform.io/intro/getting-started/install.html).

## Usage 

```bash
module "vpc" {
  source = "git::https://github.com/camilaqueiroz-mck/modules//vpc_module"
  
  env = var.env
  vpc_cidr_block = var.vpc_cidr_block
  azs = var.azs
  public_sn_cidr = var.public_sn_cidr
  private_sn_cidr = var.private_sn_cidr
}
```
## Variables and values examples

```bash 
env = "dev" | "test" | "homolog"
vpc_cidr_blocks = "10.0.0.0/16" 
azs                        = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_sn_cidr  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
private_sn_cidr = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
```

## Variable declaration 
```bash
variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Vpc cidr block"
}

variable "public_sn_cidr" {
  type        = list(string)
  description = "Subnets publics cidr block"
}

variable "private_sn_cidr" {
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

```


## Outputs

```bash
vpc_id - provides the vpc id
public_sn_id - provides the public subnets ids
private_sn_id - provides the private subnets ids

```


