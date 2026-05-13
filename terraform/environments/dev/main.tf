resource "azurerm_resource_group" "rg" {
  name     = "rg-dev"
  location = var.location
}

module "network" {
  source = "../../modules/network"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  vnet_name          = "vnet-dev"
  vnet_address_space = ["10.0.0.0/16"]

  subnet_name        = "subnet-dev"
  subnet_prefix      = ["10.0.1.0/24"]

  allowed_ip         = var.allowed_ip
}

module "vm" {
  source = "../../modules/vm"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  vm_name   = "vm-dev"

  subnet_id = module.network.subnet_id
}