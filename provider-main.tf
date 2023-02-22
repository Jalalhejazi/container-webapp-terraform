###########################
## Azure Provider - Main ##
###########################

# Define Terraform provider
terraform {
  required_version = ">= 1.3.9"

}

# Configure the Azure provider
provider "azurerm" {

  # version is optional, 
  # /strongly recommend/ using it to pin the version of the Provider being used

  # For multiple azure subscriptions: it's possible to assign the subscription id here 
  # subscription_id = var.azure_subscription_id

  skip_provider_registration = "true"

  environment = "public"


  features {}
}