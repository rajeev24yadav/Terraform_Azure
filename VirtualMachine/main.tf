
# data "azurerm_public_ip" "publicip" {
#   name                = "public_address"
#   resource_group_name = "rajeev-todo"

# }
# data "azurerm_subnet" "datasource_subnet" {
#   name                 = "subnet_fronted"
#   virtual_network_name = "rajeev-network1"
#   resource_group_name  = "rajeev-todo"

# }


# resource "azurerm_network_interface" "nic_card" {
#   for_each            = var.vm1
#   name                = each.value.nicname
#   location            = each.value.location
#   resource_group_name = each.value.rg

#   ip_configuration {
#     name                          = "linuxvm"
#     subnet_id                     = data.azurerm_subnet.datasource_subnet.id
#     private_ip_address_allocation = "Dynamic"
#     # public_ip_address_id          = data.azurerm_public_ip.publicip.id

#   }
# }

resource "azurerm_linux_virtual_machine" "machine" {
  for_each                        = var.vm1
  name                            = each.value.vmname
  resource_group_name             = each.value.rg
  location                        = each.value.location
  size                            = "Standard_DS1_v2"
  admin_username                  = data.azurerm_key_vault_secret.user-secret.value
  admin_password                  = data.azurerm_key_vault_secret.password-secret.value
  disable_password_authentication = false

  #  network_interface_ids = [
  #   azurerm_network_interface.niccard.id
  # ]
  network_interface_ids = [data.azurerm_network_interface.niccard[each.key].id]



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
