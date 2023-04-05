# eks-module
Terraform module to create an AWS ECR resource. In case you do not have terraform installed yet, the details of the terraform installation can be found in the [official documentation](https://www.terraform.io/intro/getting-started/install.html).

## Usage 

```bash
module "eks" {
  source = "git::https://github.com/camilaqueiroz-mck/modules//eks_module"
  env = var.env
  private_sn_ids = module.vpc.private_sn_id
}
```
## Variables and values examples

```bash 
env = "dev" | "test" | "homolog"
private_sn_ids = modules.vpc.private_sn_id | ["10.0.0.0/16","10.0.1.0/16"]
```

## Variable declaration 
```bash
variable "private_sn_ids" {
  type        = list(string)
  description = "Subnets private ids"
}

variable "env" {
  type        = string
  description = "enviroment"
}

```


## Outputs

```bash
eks_sg_id - provides the eks security group

```


