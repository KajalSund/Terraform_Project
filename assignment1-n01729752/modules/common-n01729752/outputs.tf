output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.n01729752-LAW.name
}

output "recovery_services_vault_name" {
  value = azurerm_recovery_services_vault.n01729752-RSV.name
}

output "storage_account_name" {
  value = azurerm_storage_account.n01729752-SA-Common.name
}

output "storage_account_primary_blob_endpoint" {
  value = azurerm_storage_account.n01729752-SA-Common.primary_blob_endpoint
}
