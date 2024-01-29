data "azurerm_key_vault" "raj-key" {
  name                = "rajeev"
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