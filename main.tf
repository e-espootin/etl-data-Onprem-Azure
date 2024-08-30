provider "azurerm" {
  features {}
  subscription_id = "8fcdb956-7c93-4e3c-8bac-8d4b21641d81"
  #tenant_id = "66acafd5-dde2-4514-b99d-106450ba1984"
}

resource "azurerm_resource_group" "Pipelines-Dev-CIndia-RG" {
  name     = "Pipelines-Dev-CIndia-RG"
  location = "Central India"
}

resource "azurerm_storage_account" "etldevindiastg2" {
  name                     = "etldevindiastg2"
  resource_group_name      = "Pipelines-Dev-CIndia-RG"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

