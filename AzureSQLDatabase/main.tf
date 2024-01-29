
resource "azurerm_sql_server" "dbs" {
  for_each                     = var.sqldb
  name                         = each.value.dbname1
  resource_group_name          = each.value.rg
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.user-secret.value
  administrator_login_password = data.azurerm_key_vault_secret.password-secret.value

}

resource "azurerm_storage_account" "storage" {
  for_each                 = var.sqldb
  name                     = each.value.aname
  resource_group_name      = each.value.rg
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_database" "database1" {
  for_each            = var.sqldb
  name                = each.value.dbname
  resource_group_name = each.value.rg
  location            = each.value.location
  server_name         = azurerm_sql_server.dbs[each.key].name


  lifecycle {
    prevent_destroy = false
  }
}