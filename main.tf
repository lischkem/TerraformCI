terraform {
  required_version = ">=1.3.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {
    organization = "Terra-MaLi"
    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rgcd" {
  name     = "rg_dna-team-cloud-engineering"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage" {
  name                     = "storagemali827cicd"
  location                 = azurerm_resource_group.rgcd.location
  resource_group_name      = azurerm_resource_group.rgcd.name
  account_replication_type = "RAGRS"
  account_tier             = "Standard"
}
