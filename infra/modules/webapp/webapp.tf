
# Create a appServicePlan
resource "azurerm_service_plan" "appserviceplan01" {
  name                = var.app_service_plan_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  os_type             = var.os_type
}

# Create a appService
resource "azurerm_linux_web_app" "appservicelinuxwebapp01" {
  name                = var.linux_web_app_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.appserviceplan01.id
  https_only          = true
  site_config {
    http2_enabled       = true
    always_on           = true
    minimum_tls_version = 1.2
  }
}


# resource "azurerm_linux_web_app_slot" "staging" {
#   name = "staging"
#   //name = var.web_app_slot_name
#   app_service_id = azurerm_linux_web_app.appservicelinuxwebapp01.id
#   https_only     = true
#   site_config {
#     always_on     = true
#     http2_enabled = true
#   }
#   app_settings = {
#     "SLOT_SETTING" = "staging"
#   }
# }

# resource "azurerm_linux_web_app_slot" "testing" {
#   name           = "testing"
#   app_service_id = azurerm_linux_web_app.appservicelinuxwebapp01.id

#   https_only = true
#   site_config {
#     always_on     = true
#     http2_enabled = true
#   }
#   app_settings = {
#     "SLOT_SETTING" = "testing"
#   }
# }
