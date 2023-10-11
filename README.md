# Terraform module: create database
## Specs
* Database owner is automatically created. 
* Randomly generated onwer's password is saved to Vault.

## Usage example
```
module "databases" {
  source = "github.com/antonvigo/pg-iac-databases"

  databases = [
    {
      name  = "db1"
      owner = "db1_admin"
    },
    {
      name  = "db2"
      owner = "db2_admin"
    }
  ]

  vault_creds_path = "creds/vault/path"
  db_encoding      = "ru_RU.UTF-8"
}
```
* It's strongly recommended to replace input constants with predefined variables containing corresponding values.
* Even if empty list of privilegs is provided all possbile privileges will be granted. Same way for some other variables.



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_postgresql"></a> [postgresql](#requirement\_postgresql) | 1.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_postgresql"></a> [postgresql](#provider\_postgresql) | 1.18.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [postgresql_database.dbs](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.18.0/docs/resources/database) | resource |
| [postgresql_role.owners](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.18.0/docs/resources/role) | resource |
| [random_password.owners](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [vault_generic_secret.db_owners](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databases"></a> [databases](#input\_databases) | Databases list to create within specified RDS host | <pre>list(object({<br>    name  = string,<br>    owner = string<br>  }))</pre> | `[]` | no |
| <a name="input_db_encoding"></a> [db\_encoding](#input\_db\_encoding) | Character set encoding to use in the database | `string` | `"ru_RU.UTF-8"` | no |
| <a name="input_vault_creds_path"></a> [vault\_creds\_path](#input\_vault\_creds\_path) | Namespace/path in Vault where new credentials will be placed regarding to the current project | `string` | `"creds/vault/path"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created"></a> [created](#output\_created) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->