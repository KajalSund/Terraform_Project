variable "prefix" {}
variable "location" {}
variable "rg_name" {}
variable "subnet_id" {}
variable "boot_diag_storage_uri" {}
variable "ssh_public_key_path" {}
variable "ssh_private_key_path" {}

variable "vm_map" {
  type = map(string)
  default = {
    "7472-centos1" = "centos1"
    "7472-centos2" = "centos2"
    "7472-centos3" = "centos3"
  }
}

variable "tags" {
  type = map(string)
}
