output "rg_names" {
  value = {
    for key, rg in azurerm_resource_group.resource_group :
    key => rg.name
  }
}


output "rg_ids" {
  value = {
    for key, rg in azurerm_resource_group.resource_group :
    key => rg.id
  }
}