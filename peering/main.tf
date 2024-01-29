resource "azurerm_virtual_network_peering" "peering1" {
  name                      = "vnetpear1"
  resource_group_name       = "rajeev-todo"
  virtual_network_name      = "rajeev-network"
  remote_virtual_network_id = "/subscriptions/fbd449d7-51e0-4eee-89b4-98e7bdf04521/resourceGroups/rajeev-todo/providers/Microsoft.Network/virtualNetworks/rajeev-network1"
}

resource "azurerm_virtual_network_peering" "peering2" {
  name                      = "vnet2"
  resource_group_name       = "rajeev-todo"
  virtual_network_name      = "rajeev-network1"
  remote_virtual_network_id = "/subscriptions/fbd449d7-51e0-4eee-89b4-98e7bdf04521/resourceGroups/rajeev-todo/providers/Microsoft.Network/virtualNetworks/rajeev-network"
}