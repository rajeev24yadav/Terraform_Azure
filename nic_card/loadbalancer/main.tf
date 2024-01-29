data "azurerm_public_ip" "publicip" {
  name                = "public_address"
  resource_group_name = "ra_rg"
  
}
resource "azurerm_lb" "alb" {
    for_each = var.TestLoadBalancer
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg

  frontend_ip_configuration {
    name                 = "ipddress"
    public_ip_address_id = data.azurerm_public_ip.publicip.id
  }
}