resource "azurerm_postgresql_server" "n01729752-PGSQLDB" {
  name                = "n01729752-pgsql"
  location            = var.rg_location
  resource_group_name = var.rg_name

  sku_name            = var.db_server_setting.sku_name         
  storage_mb          = var.db_server_setting.storage_mb            
  version             = var.db_server_setting.version

  administrator_login          = var.db_server_setting.administrator_login
  administrator_login_password = var.db_server_setting.administrator_login_password

  ssl_enforcement_enabled = var.db_server_setting.ssl_enforcement_enabled
  public_network_access_enabled = var.db_server_setting.public_network_access_enabled
  ssl_minimal_tls_version_enforced = var.db_server_setting.ssl_minimal_tls_version_enforced

  auto_grow_enabled   = var.db_server_setting.auto_grow_enabled
  backup_retention_days = var.db_server_setting.backup_retention_days
  geo_redundant_backup_enabled = var.db_server_setting.geo_redundant_backup_enabled

  tags = var.tags
}