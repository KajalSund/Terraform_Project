module "rgroup-n01729752" {
  source     = "./modules/rgroup-n01729752"
  rg_name = "n01729752-RG"
  rg_location = var.location
  tags = local.common_tags
}

module "network-n01729752" {
  source = "./modules/network-n01729752"
  rg_name = module.rgroup-n01729752.rg_name
  rg_location = module.rgroup-n01729752.rg_location

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

module "common-n01729752" {
  source = "./modules/common-n01729752"
  rg_name = module.rgroup-n01729752.rg_name
  rg_location = module.rgroup-n01729752.rg_location

  log_analytics_workspace_name = "9752law"
  recovery_services_vault_name = "rsv9752"
  common_storage_account_name = "9752commonsa"

  tags = local.common_tags
}

module "vmlinux-n01729752" {
  source                 = "./modules/vmlinux-n01729752"
  prefix                 = "n01729752"
  location               = var.location
  rg_name                = module.rgroup-n01729752.rg_name
  subnet_id              = module.network-n01729752.subnet_id
  boot_diag_storage_uri = module.common-n01729752.storage_account_primary_blob_endpoint
  ssh_public_key_path    = "~/.ssh/id_rsa.pub"
  ssh_private_key_path   = "~/.ssh/id_rsa"
  tags                   = local.common_tags
}

module "vmwindows-n01729752" {
  source = "./modules/vmwindows-n01729752"
  rg_name = module.rgroup-n01729752.rg_name
  rg_location = module.rgroup-n01729752.rg_location

  windows_os_disk = {
    caching = "ReadWrite"
    disk_size_gb = 128
    storage_account_type = "StandardSSD_LRS"
  }

  windows_os_info = {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2016-Datacenter"
    version = "latest"
  }

  extension_setting = {
    name = "IaaSAntimalware"
    publisher = "Microsoft.Azure.Security"
    type = "IaaSAntimalware"
    type_handler_version = "1.5"
  }

  storage_account_uri = module.common-n01729752.storage_account_primary_blob_endpoint
  windows_avs = "windows-aset"
  tags = local.common_tags

  subnet_id = module.network-n01729752.subnet_id
  vm_count = 1
}

module "database-n01729752" {
  source = "./modules/database-n01729752"
  rg_name = module.rgroup-n01729752.rg_name
  rg_location = module.rgroup-n01729752.rg_location

  db_server_setting = {
    sku_name     = "B_Standard_B1ms"
    sku_tier     = "Burstable"
    sku_capacity = 1
    sku_family   = "Gen5"
    storage_mb = 32768
    version = "11"
    administrator_login = "pgadmin"
    administrator_login_password = "H@Sh1CoR3!"

    ssl_enforcement_enabled = true
    public_network_access_enabled = true
    ssl_minimal_tls_version_enforced = "TLS1_2"

    auto_grow_enabled   = true
    backup_retention_days = 7
    geo_redundant_backup_enabled = false
  }

  tags = local.common_tags
}

module "datadisk-n01729752" {
  source = "./modules/datadisk-n01729752"
  rg_name = module.rgroup-n01729752.rg_name
  rg_location = module.rgroup-n01729752.rg_location

  vm_ids = concat(values(module.vmlinux-n01729752.vm_ids), module.vmwindows-n01729752.vm_ids)

  data_disk_setting = {
    storage_account_type = "Standard_LRS"
    create_option = "Empty"
    disk_size_gb = 10
  }

  data_disk_attach = {
    lun = 0
    caching = "ReadWrite"
  }

  disk_count = 4
  tags = local.common_tags
}

module "loadbalancer-n01729752" {
  source      = "./modules/loadbalancer-n01729752"
  rg_name     = module.rgroup-n01729752.rg_name
  rg_location = module.rgroup-n01729752.rg_location
  tags        = local.common_tags
  vm_nics     = [
    module.vmlinux-n01729752.nic_ids["7472-centos1"],
    module.vmlinux-n01729752.nic_ids["7472-centos2"],
    module.vmlinux-n01729752.nic_ids["7472-centos3"],
  ]
}
