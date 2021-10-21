# Terraform Settings Block
terraform {
  #required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = ">= 2.0" # Optional but recommended in production
    }
  }


provider "azurerm" {
  features {}
}
/*
terraform {
  backend "azurerm" {
    resource_group_name  = "state-rg"
    storage_account_name = "staterg999"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
}
*/
#hello123456
#####

/*
terraform {
  backend "remote" {
    organization = "azure-test-environment"

    workspaces {
      name = "TERRAFORM"
    }
  }
}
*/

###


  backend "remote" {
    organization = "azure-test-environment"

    workspaces {
      name = "sentinel-azure-demo1"
    }
  }
}