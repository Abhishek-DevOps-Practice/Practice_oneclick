

output "subnet_ids" {
  value = {
    for key, subnet in azurerm_subnet.example :
    key => subnet.id
  }
}