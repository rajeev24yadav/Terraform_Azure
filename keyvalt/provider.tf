
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "ra_rg"
  #   storage_account_name = "rajeevapps1"
  #   container_name       = "apps"
  #   key                  = "bastion1.terraform.tfstate"
  # }
}


provider "azurerm" {
  features {}

}
