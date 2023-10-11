locals {
  owners = toset([for database in var.databases : database.owner])
}


## Generate random password for all users
resource "random_password" "owners" {
  for_each = local.owners

  #  length           = 25
  length      = 16
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
  special     = false
  #  min_special      = 1
  #  override_special = "!@$%&_=+<>"
}


## Create owners roles
resource "postgresql_role" "owners" {
  for_each = local.owners

  name     = each.key
  password = random_password.owners[each.key].result

  login               = true
  skip_reassign_owned = false
}

resource "vault_generic_secret" "db_owners" {
  path = "${var.vault_creds_path}/postgres"

  data_json = jsonencode({
    for user in postgresql_role.owners : user.name => user.password
  })
}


## Create new databases
resource "postgresql_database" "dbs" {
  for_each = {
    for database in var.databases : database.name => database.owner
  }

  name  = each.key
  owner = each.value

  lc_collate = var.db_encoding
  lc_ctype   = var.db_encoding

  depends_on = [
    postgresql_role.owners
  ]
}
