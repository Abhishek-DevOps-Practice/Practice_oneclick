resource "azurerm_subnet" "example" {
  for_each             = var.subnet1
  name                 = each.value.name
  resource_group_name  = var.rg_names[each.value.rg_key]
  virtual_network_name = var.vnet_names[each.value.vnet_key]
  address_prefixes     = each.value.address
}
