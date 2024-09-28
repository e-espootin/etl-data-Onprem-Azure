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
  default = "mssqladmin"
}

variable "mssql_password" {
  type = string
  description = "MSSQL Password"
  default = "H@Sh1CoR3!a2@z1/"
}

variable "my_public_ip" {
  type = string
  description = "My Public IP"
  default = "88.152.185.77"
}

################################################################################
# azure blob storage
################################################################################
variable "azure_blob_storage_connection_string" { 
  type = string
  description = "Azure Blob Storage Connection String"
  default = "DefaultEndpointsProtocol=https;AccountName=etldevindiastg;AccountKey=B2cC5u6O7S2XdFfQkgZYQDW6KvPC4s/7hUE9wUFrz9+6x6+hSaS1uAd7jog/9RqYQnmCwMaut24m+AStijwc6Q==;EndpointSuffix=core.windows.net"
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


