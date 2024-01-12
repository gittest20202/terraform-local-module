terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.14.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "YOUR_SUBSCRIPTION_ID"
  tenant_id       = "YOUR_TENANT_ID"
  client_id       = "YOUR_CLIENT_ID"
  client_secret   = "YOUR_CLIENT_SECRET"
}
