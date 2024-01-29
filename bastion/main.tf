data "azurerm_public_ip" "publicip" {
  name                = "pip2"
  resource_group_name = "rajeev-todo"
}

data "azurerm_subnet" "datasource_subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "rajeev-network1"
  resource_group_name  = "rajeev-todo"
}

resource "azurerm_bastion_host" "apps-best" {
  for_each            = var.raj_bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.datasource_subnet.id
    public_ip_address_id = data.azurerm_public_ip.publicip.id
  }
}