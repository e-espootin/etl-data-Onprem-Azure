variable "resource_group" {
  type = string
  description = "Resource Group"
  default = "Pipelines-Dev-CIndia-RG"
}
variable "location" {
  type = string
  description = "Location"
  default = "centralindia"
}
################################################################################
# storage
################################################################################
variable "storage_account_name" {
  type = string
  description = "Storage Account Name"
  default = "etldevindiastg2"
}

################################################################################
# mssql
################################################################################  
variable "mssql_instance" {
  type = string
  description = "MSSQL Instance"
  default = "mssql-dev-india-pipelines-server"
}

variable "mssql_database" {
  type = string
  description = "MSSQL Database"
  default = "testdb1"
}

variable "mssql_user" {
  type = string
  description = "MSSQL User"
  default = terraform.tfvars.mssql_user
}

variable "mssql_password" {
  type = string
  description = "MSSQL Password"
  default = terraform.tfvars.mssql_password
}

variable "mssql_password2" {
  type = string
  description = "MSSQL Password"
  sensitive = true
  default = "test_pass"
}

variable "my_public_ip" {
  type = string
  description = "My Public IP"
  default = terraform.tfvars.my_public_ip
}


################################################################################
