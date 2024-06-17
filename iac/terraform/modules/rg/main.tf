resource "azurerm_resource_group" "main" {
  name     = "rg-${var.name_project}"
  location = var.location
}