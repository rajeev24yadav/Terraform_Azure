resource "azurerm_resource_group" "todo" {
  for_each = var.raj_rg
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}