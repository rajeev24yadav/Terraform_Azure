resource "azurerm_network_security_group" "nsgroup" {
  for_each            = var.nsgroup
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg


  dynamic "security_rule" {
    for_each = var.rajeev
      content{
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = security_rule.value.access
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value.port
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      }
  }
}
