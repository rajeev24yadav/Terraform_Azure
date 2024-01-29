data "azurerm_key_vault" "raj-key" {
  name                = "rajeev2"
  resource_group_name = "rajeev-todo"
}

data "azurerm_key_vault_secret" "user-secret" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.raj-key.id
}
data "azurerm_key_vault_secret" "password-secret" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.raj-key.id
}
data "azurerm_network_interface" "niccard" {
  for_each = var.vm1
  name                = each.value.nicname
  resource_group_name = each.value.rg
}
