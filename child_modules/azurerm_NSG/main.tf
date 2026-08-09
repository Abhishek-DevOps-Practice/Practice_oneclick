

resource "azurerm_network_security_group" "example" {
    for_each = var.NSG
  name                = each.value.name
  location            = each.value.location
  resource_group_name = var.rg_names[each.value.rg_key]

  security_rule {
   
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  
}

resource "azurerm_subnet_network_security_group_association" "example" {
  for_each = var.NSG_association
  subnet_id                 = var.subnet_ids[each.value.subnet_key]
  network_security_group_id = azurerm_network_security_group.example["nsg"].id
}

