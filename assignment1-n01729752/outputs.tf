output "rg_name" {
  value = module.rgroup-n01729752.rg_name
}

output "rg_location" {
  value = module.rgroup-n01729752.rg_location
}

output "vnet_name" {
  value = module.network-n01729752.vnet_name
}

output "subnet_name" {
  value = module.network-n01729752.subnet_name
}

output "log_analytics_workspace_name" {
  value       = module.common-n01729752.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value       = module.common-n01729752.recovery_services_vault_name
}

output "storage_account_name" {
  value       = module.common-n01729752.storage_account_name
}

output "windows_hostname"{
  value = module.vmwindows-n01729752.windows_hostname
}

output "windows_dns_labels"{
  value = module.vmwindows-n01729752.windows_dns_labels
}

output "windows_private_ips"{
  value = module.vmwindows-n01729752.windows_private_ips
}

output "windows_public_ips"{
  value = module.vmwindows-n01729752.windows_public_ips
}

output "db_server_name" {
  value = module.database-n01729752.db_server_name
}

# Linux VM outputs
output "linux_hostnames" {
  value = module.vmlinux-n01729752.hostnames
}

output "linux_dns_names" {
  value = module.vmlinux-n01729752.dns_names
}

output "linux_private_ips" {
  value = module.vmlinux-n01729752.private_ips
}

output "linux_public_ips" {
  value = module.vmlinux-n01729752.public_ips
}

# Load Balancer output
output "load_balancer_name" {
  value = module.loadbalancer-n01729752.load_balancer_name
}
