resource "azurerm_kubernetes_cluster" "testcn" {
  name                = "aks_test_evaluvation"
  location            = "West Europe"
  resource_group_name = "test_rg"
  sku_tier            = "Free"
  dns_prefix          = "testaks1"
  default_node_pool {
    name                = "test"
    vm_size             = "Standard_D2_v2"
    enable_auto_scaling = true # To prevent resource issues in system node pooln
    min_count           = 1
    max_count           = 2
    vnet_subnet_id      = azurerm_subnet.aks_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "azure"
    network_policy     = "azure"
    service_cidr       = "10.0.0.0/16"
    dns_service_ip     = "10.0.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    # Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Use standard for when enable agent_pools    availability_zones.
    
  }


}

data "azurerm_resource_group" "node_resource_group" {
  name = azurerm_kubernetes_cluster.testcn.node_resource_group
  depends_on = [
    azurerm_kubernetes_cluster.testcn
  ]
}

resource "azurerm_role_assignment" "node_infrastructure_update_scale_set" {
  principal_id         = azurerm_kubernetes_cluster.testcn.kubelet_identity.0.object_id
  scope                = data.azurerm_resource_group.node_resource_group.id
  role_definition_name = "Virtual Machine Contributor"
  depends_on = [
    azurerm_kubernetes_cluster.testcn
  ]
}
