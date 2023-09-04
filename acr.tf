
resource "azurerm_container_registry" "test" {
  name                   = "testacrforevaluvation"
  resource_group_name    = "test_rg"
  location               = "West Europe"
  sku                    = "Standard"
  admin_enabled          = false
  export_policy_enabled  = true
  anonymous_pull_enabled = false
}

resource "azurerm_role_assignment" "test" {
  scope                = azurerm_container_registry.test.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.testcn.kubelet_identity.0.object_id
}
