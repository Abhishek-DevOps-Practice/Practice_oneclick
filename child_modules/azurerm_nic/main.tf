
resource "azurerm_network_interface" "example" {
  for_each            = var.network_interface
  name                = each.value.name
  location            = each.value.location
  resource_group_name = var.rg_names[each.value.rg_key]

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = var.subnet_ids[each.value.ip_configuration.subnet_key]
    private_ip_address_allocation = each.value.ip_configuration.private_ip
  }
}