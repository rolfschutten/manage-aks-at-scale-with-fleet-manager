resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet-${var.ServiceName}-${var.EnvironmentPrefix}-001"
  address_space       = ["10.0.0.0/8"]
  location            = "${var.Location}"
  resource_group_name = azurerm_resource_group.fleet.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "sn-${var.ServiceName}-${var.EnvironmentPrefix}-001"
  resource_group_name  = azurerm_resource_group.fleet.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "sn-${var.ServiceName}-${var.EnvironmentPrefix}-002"
  resource_group_name  = azurerm_resource_group.fleet.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.2.0.0/16"]
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "vnet-${var.ServiceName}-${var.EnvironmentPrefix}-002"
  address_space       = ["10.0.0.0/8"]
  location            = "${var.secLocation}"
  resource_group_name = azurerm_resource_group.fleet.name
}

resource "azurerm_subnet" "subnet3" {
  name                 = "sn-${var.ServiceName}-${var.EnvironmentPrefix}-003"
  resource_group_name  = azurerm_resource_group.fleet.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["10.1.0.0/16"]
}
