terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01729752RG"
    storage_account_name = "tfstaten01729752sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
}