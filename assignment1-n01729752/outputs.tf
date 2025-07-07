output "rg_name" {
  value = module.resource_group.rg_name
}

output "rg_location" {
  value = module.resource_group.rg_location
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "log_analytics_workspace_name" {
  value       = module.common.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value       = module.common.recovery_services_vault_name
}

output "storage_account_name" {
  value       = module.common.storage_account_name
}