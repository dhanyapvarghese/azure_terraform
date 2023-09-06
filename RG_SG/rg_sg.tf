terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.40.0"
    }
  }
}
provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "test" {
  name     = "test_rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "test" {
  name                     = "evaluvationtestsgbackup"
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "test"
  }
}
resource "azurerm_storage_container" "test" {
  name                  = "testcn"
  storage_account_name  = azurerm_storage_account.test.name
  container_access_type = "private"

}