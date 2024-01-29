
resource "azurerm_lb" "balance" {
  for_each            = var.test_balancer
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg
  sku                 = each.value.sku

  frontend_ip_configuration {
    name                 = data.azurerm_public_ip.public.name
    public_ip_address_id = data.azurerm_public_ip.public.id
  }
}
resource "azurerm_lb_backend_address_pool" "rajpool" {
  for_each        = var.test_balancer
  loadbalancer_id = azurerm_lb.balance[each.key].id
  name            = "Back-Pool"
}


resource "azurerm_network_interface_backend_address_pool_association" "raj" {
  for_each                = var.test_balancer
  network_interface_id    = data.azurerm_network_interface.niccard[each.key].id
  ip_configuration_name   = "niccard"
  backend_address_pool_id = azurerm_lb_backend_address_pool.rajpool[each.key].id
}

resource "azurerm_lb_probe" "raj" {
  for_each            = var.test_balancer
  loadbalancer_id     = azurerm_lb.balance[each.key].id
  name                = "raj-probe"
  port                = 80
  protocol            = "Tcp"
  interval_in_seconds = 5
}
resource "azurerm_lb_rule" "role" {
  for_each                       = var.test_balancer
  loadbalancer_id                = azurerm_lb.balance[each.key].id
  name                           = each.value.name1
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.rajpool[each.key].id]
}
