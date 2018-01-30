provider "azurerm" {}

  module "example" {
    source  = "Azure/compute/azurerm"
    version = "1.1.5"

    # insert the 2 required variables here
    location = "${azurerm_resource_group.network.location}"

    vnet_subnet_id = "${sb_address_id}"

  }

resource "azurerm_resource_group" "network" {
  name     = "production"
  location = "East US"

  tags {
    enviroment = "Production"
  }
}

resource "azurerm_virtual_network" "network" {
  name                = "${var.vn_name}"
  address_space       = "${var.vn_address_space}"
  location            = "${azurerm_resource_group.network.location}"
  resource_group_name = "${azurerm_resource_group.network.name}"

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
  }
}

resource "azurerm_subnet" "myfirstsubnet" {
  name                 = "${var.sb_name}"
  resource_group_name  = "${azurerm_resource_group.network.name}"
  virtual_network_name = "${azurerm_virtual_network.network.name}"
  address_prefix       = "${var.sb_address_prefix}"
}

output "sb_address_prefix" {
  value = "${azurerm_subnet.myfirstsubnet.address_prefix}"
}

output "sb_address_id" {
  value = "${azurerm_subnet.myfirstsubnet.id}"
}
