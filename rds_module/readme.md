# rds-module
Terraform module to create an AWS ECR resource. In case you do not have terraform installed yet, the details of the terraform installation can be found in the [official documentation](https://www.terraform.io/intro/getting-started/install.html).

## Usage 

```bash
module "rds" {
  source = "git::https://github.com/camilaqueiroz-mck/modules//rds_module"
  
  env = var.env
  private_sn_ids = module.vpc.private_sn_id
  vpc_id = module.vpc.vpc_id
  db_username = var.db_username
  db_password = var.db_password
  eks_sg_id = module.eks.eks_sg_id
}
```
## Variables and values examples

```bash 
env = "dev" | "test" | "homolog"
private_sn_ids = module.vpc.private_sn_id | ["subnet-0d33d47b692f91d69", "subnet-0e1c7074805c4a9d1"]
vpc_id = module.vpc.vpc_id  | "vpc-094d00a68c1ab1b65"
db_username = "admin"
db_password = "password23@"
eks_sg_id = module.eks.eks_sg_id | "sg-027451e3dcf1ca68c"

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


