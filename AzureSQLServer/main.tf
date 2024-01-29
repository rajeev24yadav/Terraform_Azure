resource "azurerm_sql_server" "sqlserver" {
  for_each                     = var.todosql11
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.user-secret.value
  administrator_login_password = data.azurerm_key_vault_secret.password-secret.value

}