
resource "azurerm_public_ip" "example" {
  for_each = var.public_ip
  name                = each.value.name
  location            = each.value.location
  resource_group_name = var.rg_names[each.value.rg_key]
  allocation_method   = each.value.allocation
  sku                 = each.value.sku
}
resource "azurerm_subnet" "bastion" {
    for_each = var.bastion_subnet
  name                 = each.value.name
  resource_group_name  = var.rg_names[each.value.rg_key]
  virtual_network_name = var.vnet_names[each.value.vnet_key]
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_bastion_host" "example" {
  depends_on = [ azurerm_subnet.bastion ]
  for_each = var.bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = var.rg_names[each.value.rg_key]

  ip_configuration {
     name      = each.value.ip_configuration.name
    subnet_id  = azurerm_subnet.bastion["bas"].id
    public_ip_address_id = azurerm_public_ip.example["public"].id
  }
}