resource "azurerm_public_ip" "address" {
  for_each            = var.publicip
  name                = each.value.name
  resource_group_name = each.value.rg
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku


}