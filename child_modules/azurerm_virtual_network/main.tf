
resource "azurerm_virtual_network" "example" {
  for_each            = var.virtual_network
  name                = each.value.name
  location            = each.value.location
  resource_group_name = var.rg_names[each.value.rg_key]
  address_space       = each.value.address

}