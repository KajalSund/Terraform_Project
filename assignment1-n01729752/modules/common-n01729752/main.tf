resource "azurerm_log_analytics_workspace" "n01729752-LAW" {
  name                = var.log_analytics_workspace_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = var.tags
}

resource "azurerm_recovery_services_vault" "n01729752-RSV" {
  name                = var.recovery_services_vault_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  sku                 = "Standard"

  tags = var.tags
}

resource "azurerm_storage_account" "n01729752-SA-Common" {
  name = "${var.common_storage_account_name}7472"
  location            = var.rg_location
  resource_group_name = var.rg_name
  account_tier            = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}
