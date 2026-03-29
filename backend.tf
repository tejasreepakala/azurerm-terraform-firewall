terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstatepakhala" 
    container_name       = "tfstate"
    key                  = "firewall.terraform.tfstate"
  }
}