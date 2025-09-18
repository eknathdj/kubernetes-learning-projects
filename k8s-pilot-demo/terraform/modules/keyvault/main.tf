variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "keyvault_name" { type = string }

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false
}

output "keyvault_id" {
  value = azurerm_key_vault.kv.id
}
