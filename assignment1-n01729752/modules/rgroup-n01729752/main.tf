resource "azurerm_resource_group" "n01729752-RG" {
  name     = var.rg_name
  location = var.rg_location
  tags = var.tags
}