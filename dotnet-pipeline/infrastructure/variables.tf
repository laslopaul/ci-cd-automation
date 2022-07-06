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