variable "subscription_id" { type = string, default = "" }
variable "tenant_id" { type = string, default = "" }
variable "location" { type = string, default = "eastus" }

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}


