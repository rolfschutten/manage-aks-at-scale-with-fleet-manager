resource "azurerm_resource_group" "aks1" {
  name     = "rg-${var.ServiceName}-aks-${var.EnvironmentPrefix}-001"
  location = "${var.Location}"
}

resource "azurerm_kubernetes_cluster" "aks1" {
  name                = "aks-${var.ServiceName}-${var.EnvironmentPrefix}-001"
  location            = azurerm_resource_group.aks1.location
  resource_group_name = azurerm_resource_group.aks1.name
  dns_prefix          = "aks1"

  default_node_pool {
    name              = "default"
    node_count        = 1
    vm_size           = "Standard_B2ms"
    vnet_subnet_id    = azurerm_subnet.subnet1.id
  }

  network_profile {
    network_plugin    = "azure"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azapi_resource" "member1" {
  type = "Microsoft.ContainerService/fleets/members@2022-09-02-preview"
  name = "flmem-${var.ServiceName}-${var.EnvironmentPrefix}-001"
  parent_id = azurerm_kubernetes_fleet_manager.fleet.id
  body = jsonencode({
    properties = {
      clusterResourceId = azurerm_kubernetes_cluster.aks1.id
    }
  })
  depends_on = [
    azurerm_kubernetes_fleet_manager.fleet,
    azurerm_kubernetes_cluster.aks1
  ]
}

resource "azurerm_resource_group" "aks2" {
  name     = "rg-${var.ServiceName}-aks-${var.EnvironmentPrefix}-002"
  location = "${var.Location}"
}

resource "azurerm_kubernetes_cluster" "aks2" {
  name                = "aks-${var.ServiceName}-${var.EnvironmentPrefix}-002"
  location            = azurerm_resource_group.aks2.location
  resource_group_name = azurerm_resource_group.aks2.name
  dns_prefix          = "aks2"

  default_node_pool {
    name              = "default"
    node_count        = 1
    vm_size           = "Standard_B2ms"
    vnet_subnet_id    = azurerm_subnet.subnet2.id
  }

  network_profile {
    network_plugin    = "azure"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azapi_resource" "member2" {
  type = "Microsoft.ContainerService/fleets/members@2022-09-02-preview"
  name = "flmem-${var.ServiceName}-${var.EnvironmentPrefix}-002"
  parent_id = azurerm_kubernetes_fleet_manager.fleet.id
  body = jsonencode({
    properties = {
      clusterResourceId = azurerm_kubernetes_cluster.aks2.id
    }
  })
  depends_on = [
    azurerm_kubernetes_fleet_manager.fleet,
    azurerm_kubernetes_cluster.aks2
  ]
}

resource "azurerm_resource_group" "aks3" {
  name     = "rg-${var.ServiceName}-aks-${var.EnvironmentPrefix}-003"
  location = "${var.Location}"
}

resource "azurerm_kubernetes_cluster" "aks3" {
  name                = "aks-${var.ServiceName}-${var.EnvironmentPrefix}-003"
  location            = azurerm_resource_group.aks3.location
  resource_group_name = azurerm_resource_group.aks3.name
  dns_prefix          = "aks3"

  default_node_pool {
    name              = "default"
    node_count        = 1
    vm_size           = "Standard_B2ms"
    vnet_subnet_id    = azurerm_subnet.subnet3.id
  }

  network_profile {
    network_plugin    = "azure"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azapi_resource" "member3" {
  type = "Microsoft.ContainerService/fleets/members@2022-09-02-preview"
  name = "flmem-${var.ServiceName}-${var.EnvironmentPrefix}-003"
  parent_id = azurerm_kubernetes_fleet_manager.fleet.id
  body = jsonencode({
    properties = {
      clusterResourceId = azurerm_kubernetes_cluster.aks3.id
    }
  })
  depends_on = [
    azurerm_kubernetes_fleet_manager.fleet,
    azurerm_kubernetes_cluster.aks3
  ]
}
