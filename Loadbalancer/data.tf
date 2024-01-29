data "azurerm_public_ip" "public" {
  name                = "pip2"
  resource_group_name = "rajeev-todo"
}
data "azurerm_network_interface" "niccard" {
  for_each            = var.test_balancer
  name                = each.value.network
  resource_group_name = each.value.rg
}
data "azurerm_subnet" "datasource_subnet" {
  name                 = "subnet_fronted"
  virtual_network_name = "rajeev-network1"
  resource_group_name  = "rajeev-todo"

}
data "azurerm_virtual_network" "test_net" {
  name                = "rajeev-network1"
  resource_group_name = "rajeev-todo"
}