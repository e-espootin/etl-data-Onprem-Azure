
################################################################################
# Storage Account
################################################################################
resource "azurerm_storage_account" "etldevindiastg2" {
   name                     = var.storage_account_name
   resource_group_name      = var.resource_group
   location                 = var.location
   account_tier             = "Standard"
   account_replication_type = "LRS"
}

################################################################################
# Azure SQL Server
################################################################################

# Azure SQL Server
resource "azurerm_mssql_server" "main" {
  name                         = var.mssql_instance
  resource_group_name          = var.resource_group
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.mssql_user
  administrator_login_password = var.mssql_password


  azuread_administrator {
    login_username = "ebrahim espootin"
    object_id      = "f5c64639-4a6c-4c32-9ce8-4fc8abed3fa8"

  }

  # assign a user to the server

} 


# Allow Azure services to access the SQL Server
resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name                = "AllowAzureServices"
  server_id           = azurerm_mssql_server.main.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}


# Create a firewall rule to allow access from the connected IP
resource "azurerm_mssql_firewall_rule" "allow_my_ip" {
  name                = "AllowMyIP"
  server_id           = azurerm_mssql_server.main.id
  start_ip_address    = var.my_public_ip
  end_ip_address      = var.my_public_ip
}


# Azure SQL Database
resource "azurerm_mssql_database" "db" {
  name      = var.mssql_database
  server_id = azurerm_mssql_server.main.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb    = 4
  read_scale     = false
  sku_name       = "GP_S_Gen5_2"
  zone_redundant = false
  enclave_type   = "VBS"
  auto_pause_delay_in_minutes      = 60  # Auto-pause after 1 hour of inactivity
  min_capacity                     = 0.5  # Minimum compute capacity
  # Backup storage redundancy > localy TODO

  
} 

