
resource "azurerm_virtual_network" "rajeev" {
  for_each            = var.rajeev_vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg
  address_space       = each.value.address_space

  dynamic "subnet" {
    for_each = var.rajsubnet == null ? {} : var.rajsubnet
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = subnet.value.security_group
    }
  }


}
output "virtual_network_id" {
  value = { for k, v in azurerm_virtual_network.rajeev : k => v.id }
}