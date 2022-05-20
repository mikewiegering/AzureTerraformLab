

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.98.0"
    }
  }
}

#Declare Variables

variable "mikey_client_secret" {}

variable "mikey_subscription_id" {}

variable "mikey_client_id"{}

variable "mikey_tenant_id" {}

variable "location" {}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.mikey_subscription_id
  client_id       = var.mikey_client_id
  client_secret   = var.mikey_client_secret
  tenant_id       = var.mikey_tenant_id
}

# Create a resource group for the demo

resource "azurerm_resource_group" "has_demo_rg" {
  name     = "has_demo_rg"
  location = var.location
}