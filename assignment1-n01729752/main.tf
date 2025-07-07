module "resource_group" {
  source     = "./modules/rgroup-n01729752"
  rg_name = "n01729752-RG"
  rg_location = "East US"
  tags = local.common_tags
}

module "network" {
  source = "./modules/network-n01729752"
  rg_name = module.resource_group.rg_name
  rg_location = module.resource_group.rg_location

  vnet = "n01729752-VNET"
  vnet_space = ["10.0.0.0/16"]
  subnet = "n01729752-SUBNET"
  subnet_space = ["10.0.0.0/24"]

  security_group1 = {
      sg_name        = "9752-nsg1"
      rule1_name     = "rule1"
      rule1_priority = 100
      direction      = "Inbound"
      access         = "Allow"
      protocol       = "Tcp"
      rule1_dst      = "22"
      rule2_name     = "rule2"
      rule2_priority = 200
      rule2_dst      = "80"
      rule3_name     = "rule3"
      rule3_priority = 300
      rule3_dst      = "3389"
      rule4_name     = "rule4"
      rule4_priority = 400
      rule4_dst      = "5985"
  }
  tags = local.common_tags
}

module "common" {
  source = "./modules/common-n01729752"
  rg_name = module.resource_group.rg_name
  rg_location = module.resource_group.rg_location

  log_analytics_workspace_name = "9752law"
  recovery_services_vault_name = "rsv9752"
  common_storage_account_name = "9752commonsa"

  tags = local.common_tags
}

locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Haodong Mai, Kajal"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}