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
