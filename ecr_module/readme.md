# ecr-module
Terraform module to create an AWS ECR resource. In case you do not have terraform installed yet, the details of the terraform installation can be found in the [official documentation](https://www.terraform.io/intro/getting-started/install.html).

## Usage 

```bash
module "ecr" {
  source = "git::https://github.com/camilaqueiroz-mck/modules//ecr_module"
  name = var.name
}
```
## Variables and values examples

```bash 
name = "app_name"
```

## Variable declaration 
```bash
variable "name" {
  type = string
  default = "nome do repositorio"
}
```


## Outputs

```bash
None

```


