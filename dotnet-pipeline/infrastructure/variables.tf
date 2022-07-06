# Global variables

variable "location" {
  default     = "eastus"
  description = "Location of Azure resources"
}

# Variables for .NET application resources

variable "dotnetapp_rg_name" {
  default     = "dotnetapp"
  description = "Name of resource group for .NET application"
}

variable "service_plan_name" {
  default     = "dotnetapp_service_plan"
  description = "Name of Azure App Service Plan"
}

variable "appservice_name" {
  default     = "laslopaul-dotnetapp"
  description = "Name of Azure App Service"
}

# Variables for Azure SQL database
variable "sql_server_name" {
  default     = "dotnetapp-sqlserver"
  description = "Name of Azure SQL server"
}

variable "sql_login" {
  sensitive = true
}

variable "sql_password" {
  sensitive = true
}

variable "storage_account_name" {
  default     = "sqlstoragelaslopaul"
  description = "Name of storage account for SQL database"
}

variable "db_name" {
  default     = "dotnetapp-db"
  description = "Database name for .NET application"
}