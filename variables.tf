variable "databases" {
  description = "Databases list to create within specified RDS host"
  type = list(object({
    name  = string,
    owner = string
  }))
  default = []
}

variable "vault_creds_path" {
  description = "Namespace/path in Vault where new credentials will be placed regarding to the current project"
  type        = string
  default     = "creds/vault/path"
}

variable "db_encoding" {
  description = "Character set encoding to use in the database"
  type        = string
  default     = "ru_RU.UTF-8"
}
