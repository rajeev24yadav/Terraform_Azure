
data "azurerm_virtual_network" "todoapp_vnetdatablock" {
  name                = "rajeev-network1"
  resource_group_name = "rajeev-todo"
}

data "azurerm_public_ip" "pip" {
  name                = "pip2"
  resource_group_name = "rajeev-todo"
}

data "azurerm_network_interface" "niccard" {
  for_each            = var.vms
  name                = each.value.network_interface_name
  resource_group_name = "rajeev-todo"
}


# data "azurerm_lb" "todoapp_lbdatablock" {
#   name                = "lb-todoapp"
#   resource_group_name = data.azurerm_resource_group.todoapp_rgdatablock.name
# }