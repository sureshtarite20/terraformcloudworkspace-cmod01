terraform {
  required_version = "~> 1.5.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = " 3.69" # for production-grade
    }
  }
}
provider "azurerm" {
  features {}
}
#######
module "rg_module" {
  source                  = "./modules/rg"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "web_module" {
  source                  = "./modules/webapp"
  resource_group_name     = module.rg_module.rgname
  resource_group_location = var.resource_group_location
  app_service_plan_name   = var.app_service_plan_name
  sku_name                = var.sku_name
  os_type                 = var.os_type
  linux_web_app_name      = var.linux_web_app_name
  //web_app_slot_name = var.web_app_slot_name
  depends_on = [module.rg_module]
}
