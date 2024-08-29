provider "azurerm" {
  features {}
  subscription_id = "8fcdb956-7c93-4e3c-8bac-8d4b21641d81"
  #tenant_id = "66acafd5-dde2-4514-b99d-106450ba1984"
}

resource "azurerm_resource_group" "tfexample" {
  name     = "Pipelines-Dev-CIndia-RG"
  location = "Central India"
}

