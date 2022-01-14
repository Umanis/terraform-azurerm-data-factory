terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.90.0"
    }

    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = ">= 1.2.10"
    }
  }
}

