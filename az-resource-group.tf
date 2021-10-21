/*# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = ">= 2.0" # Optional but recommended in production
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}*/

# Create Resource Group
resource "azurerm_resource_group" "myrg" {
 # lifecycle {
  #  prevent_destroy = yes
  #}
  #for_each = {
   # location1 = "eastus"
   # location2 = "westus"
  
  location = "eastus"
  name = "rg1-project1-eastus"
}

# test comment
/*
resource "azurerm_virtual_network" "myvn11" {
  name                = "example-vnet1"
  address_space       = ["10.1.0.0/16"]
  #location            = azurerm_resource_group.myrg2.location
  location = data.terraform_remote_state.project1.outputs.azurerm_resource_group_location
  #resource_group_name = azurerm_resource_group.myrg2.name
  resource_group_name = data.terraform_remote_state.project1.outputs.azurerm_resource_group_name
}
*/

##