
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "todo_resource"
    storage_account_name = "todo3"
    container_name       = "apps"
    key                  = "lb.terraform.tfstate"
  }
}


provider "azurerm" {
  features {}

}
