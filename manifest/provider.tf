terraform {
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "=0.1.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.2"   
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.16.0"
    }
}