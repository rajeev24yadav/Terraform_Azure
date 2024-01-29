resource "azurerm_storage_account" "rajstorage" {
  for_each                 = var.amit-storage
  name                     = each.value.name
  resource_group_name      = each.value.rg
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type


}

resource "azurerm_storage_container" "amit" {
  for_each              = var.amit-storage
  name                  = each.value.block
  storage_account_name  = azurerm_storage_account.rajstorage[each.key].name
  container_access_type = each.value.container_access_type
}