resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.testcn]
  filename   = "kubeconfig"
  content    = azurerm_kubernetes_cluster.testcn.kube_config_raw
}