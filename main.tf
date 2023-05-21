data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "fleet" {
  name     = "rg-${var.ServiceName}-hub-${var.EnvironmentPrefix}-001"
  location = "${var.Location}"
}

resource "azurerm_kubernetes_fleet_manager" "fleet" {

  hub_profile {
    dns_prefix = "${var.ServiceName}"
  }

  location            = azurerm_resource_group.fleet.location
  name                = "flhub-${var.ServiceName}-${var.EnvironmentPrefix}-001"
  resource_group_name = azurerm_resource_group.fleet.name
}
