provider "azurerm" {
  features {}
}
variable "prefix" {
  default = "DevOps_final_project"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = "uksouth"
}
module "AZ_project_VM" {
    source = "./VM"
    resource_group_name = azurerm_resource_group.main.name
    resource_group_location = azurerm_resource_group.main.location
    prefix = var.prefix
}
