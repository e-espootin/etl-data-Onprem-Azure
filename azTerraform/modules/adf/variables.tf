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

variable "my_public_ip" {
  type = string
  description = "My Public IP"
  default = terraform.tfvars.my_public_ip
}

################################################################################
# azure blob storage
################################################################################
variable "azure_blob_storage_connection_string" { 
  type = string
  description = "Azure Blob Storage Connection String"
  default = terraform.tfvars.azure_blob_storage_connection_string
}

variable "uploaded_path" {
  type = string
  description = "Uploaded Path"
  default = "uploaded-files/"
}

variable "lookup_filename" {
  type = string
  description = "Lookup Filename"
  default = "lookup-config.csv"
}

variable "sample_filename" {
  type = string
  description = "Lookup Path"
  default = "customer_2024_09_26_10.parquet"
}


