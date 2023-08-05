resource "azurerm_container_group" "example" {
  name                = "kaexample-container"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  ip_address_type     = "Public"
  dns_name_label      = "kavyaaci-label"
  os_type             = "Linux"

  container {
    name   = "hello-world"
    image  = "settlemint.azurecr.io/nft-bridge:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 8080
      protocol = "TCP"
    }
  }

  tags = {
    environment = "testing"
  }
}