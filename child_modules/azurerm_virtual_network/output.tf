output "vnet_names" {
  value = {
    for key, vnet in azurerm_virtual_network.example :
    key => vnet.name
  }
}