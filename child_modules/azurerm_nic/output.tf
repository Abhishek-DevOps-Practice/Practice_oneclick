output "nic_ids" {
  value = {
    for key, nic in azurerm_network_interface.example :
    key => nic.id
  }
}