resource_group = {
  rg1 = {
    name     = "module_rg"
    location = "central india"
  }
}

virtual_network = {
  vnet1 = {
    name     = "Vnet-1"
    location = "Central India"
    rg_key   = "rg1"
    address  = ["10.1.0.0/16"]
  }
}

subnet1 = {
  "Windows_subnet" = {
    name     = "Windows_subnet"
    address  = ["10.1.1.0/24"]
    vnet_key = "vnet1"

    rg_key = "rg1"
  }
  "linux_subnet" = {
    name     = "linux_subnet"
    address  = ["10.1.2.0/24"]
    vnet_key = "vnet1"
    rg_key   = "rg1"
  }
}

public_ip = {
  public = {
    name       = "Publicip"
    location   = "Central India"
    rg_key     = "rg1"
    allocation = "Static"
    sku        = "Standard"
  }
}

bastion = {
  bastion1 = {
    name     = "AzureBastionSubnet"
    location = "Central India"
    rg_key   = "rg1"
    ip_configuration = {
      name = "configuration"

    }

  }

}

bastion_subnet = {
  bas = {
    name             = "AzureBastionSubnet"
    rg_key           = "rg1"
    vnet_key         = "vnet1"
    address_prefixes = ["10.1.3.0/26"]
  }
}

NSG = {
  nsg = {
    name     = "NSG"
    location = "Central India"
    rg_key   = "rg1"
  }
}

NSG_association = {
  win = {
    subnet_key = "Windows_subnet"

  }

  linux = {
    subnet_key = "linux_subnet"

  }
}

network_interface = {
  Windows_subnet = {
    name     = "Windowsnic"
    location = "Central India"
    rg_key   = "rg1"
    ip_configuration = {
      name       = "ip1"
      subnet_key = "Windows_subnet"
      private_ip = "Dynamic"
    }

  }
  linux_subnet_subnet = {
    name     = "linuxnic"
    location = "Central India"
    rg_key   = "rg1"
    ip_configuration = {
      name       = "ip1"
      subnet_key = "linux_subnet"
      private_ip = "Dynamic"
    }
  }
}

vm = {
  vm1 = {
    name     = "frontend-vm"
    location = "Central India"
    rg_key   = "rg1"
    nic_key  = "linux_subnet_subnet"
    vm_size  = "Standard_D2s_v3"
  }

  vm2 = {
    name     = "backend-vm"
    location = "Central India"
    rg_key   = "rg1"
    nic_key  = "Windows_subnet"
    vm_size  = "Standard_D2s_v3"
  }
}