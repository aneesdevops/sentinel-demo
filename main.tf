# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = ">= 2.0" # Optional but recommended in production
    }
  }

backend "remote" {
    organization = "azure-test-environment"

    workspaces {
      name = "sentinel-azure-demo2"
    }
  }
}
provider "azurerm" {
  features {}
}

# my test comment1
# my comment on main branch
# feature2