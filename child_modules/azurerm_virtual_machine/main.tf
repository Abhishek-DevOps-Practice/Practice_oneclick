resource "azurerm_virtual_machine" "main" {
  for_each              = var.vm
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = var.rg_names[each.value.rg_key]
  network_interface_ids = [var.nic_ids[each.value.nic_key]]
  vm_size               = each.value.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
storage_os_disk {
  name              = each.value.os_disk_name
  caching           = "ReadWrite"
  create_option     = "FromImage"
  managed_disk_type = "Standard_LRS"
}
  os_profile {
    computer_name  = "hostname"
    admin_username = "azureuser"
    admin_password = "Azure@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}