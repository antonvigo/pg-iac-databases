terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.18.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 1.3.0"
}
