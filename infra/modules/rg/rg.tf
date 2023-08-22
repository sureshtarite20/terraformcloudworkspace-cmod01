# Create a resourceGroup
resource "azurerm_resource_group" "RG01" {
  name     = var.resource_group_name
  location = var.resource_group_location
}