/*data "terraform_remote_state" "project1" {
  backend = "azurerm"
  config = {
    resource_group_name  = "state-rg"
    storage_account_name = "staterg999"
    container_name       = "tfstatefiles-project2"
    key                  = "terraform2.tfstate"
  }
}*/