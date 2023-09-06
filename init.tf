terraform {
  backend "azurerm" {
    resource_group_name  = "test_rg"
    storage_account_name = "evaluvationtestsgbackup"
    container_name       = "testcn"
    key                  = "terraform.tfstate"
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.40.0"
    }
     kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10.0"
    }
    
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.5.0"
    }
  }
  
  
}
provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}




