# DevOps Git workflow practice - feature/mcp

module "resource_group" {
  source         = "../child_modules/azurerm_resource_group"
  resource_group = var.resource_group

}

module "virtual_network" {
  source          = "../child_modules/azurerm_virtual_network"
  virtual_network = var.virtual_network
  rg_names        = module.resource_group.rg_names
}

module "subnets" {
  source     = "../child_modules/azurerm_subnet"
  subnet1    = var.subnet1
  rg_names   = module.resource_group.rg_names
  vnet_names = module.virtual_network.vnet_names
}

module "bastion" {
  source         = "../child_modules/azurerm_bastion"
  public_ip      = var.public_ip
  bastion        = var.bastion
  bastion_subnet = var.bastion_subnet
  rg_names       = module.resource_group.rg_names
  vnet_names     = module.virtual_network.vnet_names
}

module "NSG_association" {
  source          = "../child_modules/azurerm_NSG"
  NSG             = var.NSG
  NSG_association = var.NSG_association
  rg_names        = module.resource_group.rg_names
  subnet_ids      = module.subnets.subnet_ids
}

module "NIC" {
  source            = "../child_modules/azurerm_nic"
  network_interface = var.network_interface
  rg_names          = module.resource_group.rg_names
  subnet_ids        = module.subnets.subnet_ids
}

module "virtual_machine" {
  source   = "../child_modules/azurerm_virtual_machine"
  vm       = var.vm
  rg_names = module.resource_group.rg_names
  nic_ids  = module.NIC.nic_ids
}