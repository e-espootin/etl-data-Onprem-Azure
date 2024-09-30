provider "azurerm" {
  features {}
  subscription_id = "8fcdb956-7c93-4e3c-8bac-8d4b21641d81"

}

module "dev" {
  source = "./environments/dev"
}

module "adf" {
  source = "./modules/adf"
}
