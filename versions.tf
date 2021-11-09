terraform {
  required_version = ">= 0.15.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.84.0"
    }

    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = ">= 1.2.6"
    }
  }
}

