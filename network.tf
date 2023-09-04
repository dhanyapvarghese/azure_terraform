resource "azurerm_virtual_network" "vnet" {
  name                = "test_vnet"
  address_space       = ["10.1.0.0/16"]
  location            = "West Europe"
  resource_group_name = "test_rg"
}
resource "azurerm_subnet" "aks_subnet" {
  name                 = "test_subnet"
  resource_group_name  = "test_rg"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.0.0/24"]
}
resource "azurerm_subnet" "app_gwsubnet" {
  name                 = "test_appgateway"
  resource_group_name  = "test_rg"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.1.0/24"]
}