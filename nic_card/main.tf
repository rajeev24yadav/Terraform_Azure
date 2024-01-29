data "azurerm_subnet" "datasource_subnet" {
  name                 = "subnet_fronted"
  virtual_network_name = "rajeev-network1"
  resource_group_name  = "rajeev-todo"

}
resource "azurerm_network_interface" "testnic" {
  for_each            = var.nic_card
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg

  ip_configuration {
    name                          = "niccard"
    subnet_id                     = data.azurerm_subnet.datasource_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
