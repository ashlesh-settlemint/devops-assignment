resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}

resource "random_string" "container_name" {
  length  = 25
  lower   = true
  upper   = false
  special = false
}

resource "azurerm_container_group" "container" {
  name                = "${var.container_group_name_prefix}-${random_string.container_name.result}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  ip_address_type     = "Public"
  os_type             = "Linux"
  restart_policy      = var.restart_policy
  image_registry_credential {
   server = var.ContainerInstances.server
   username = var.ContainerInstances.username
   password = var.ContainerInstances.password
  }

  container {
    name   = "${var.container_name_prefix}-${random_string.container_name.result}"
    image  = var.image
    cpu    = var.cpu_cores
    memory = var.memory_in_gb
    environment_variables        = var.ContainerInstances.Container.EnvironmentVariables

    ports {
      port     = var.port
      protocol = "TCP"
    }
  }
}
