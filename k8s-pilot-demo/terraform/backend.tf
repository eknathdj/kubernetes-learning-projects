# Example backend config for Azure Storage Account
# Update values to match your storage account, resource group and container.
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateacct"
    container_name       = "tfstate"
    key                  = "k8s-pilot-demo.terraform.tfstate"
  }
}
