# Variables for Terraform backend storage

variable "tfstate_rg_name" {
  default     = "tfstate"
  description = "Name of resource group for Terraform remote state"
}

variable "location" {
  default     = "eastus"
  description = "Location of Azure resources"
}

variable "storage_account_prefix" {
  default     = "laslopaul"
  description = "Prefix used in the URL of Azure storage account"
}

variable "storage_container_name" {
  default     = "tfstate"
  description = "Name of blob container to store Terraform state"
}