terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "1.14.0"
    }
  }
  required_version = ">= 1.6.3"
}