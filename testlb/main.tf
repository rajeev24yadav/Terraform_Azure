
resource "azurerm_public_ip" "iptest" {
  name                = "PublicIP1"
  location            = "East Asia"
  resource_group_name = "rajeev-todo"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "lb_test" {
  name                = "TestLoadBalancer"
  location            = "East Asia"
  resource_group_name = "rajeev-todo"
   sku                 = "Standard"

  frontend_ip_configuration {
    name                 = azurerm_public_ip.iptest.name
    public_ip_address_id = azurerm_public_ip.iptest.id
  }
}
resource "azurerm_lb_backend_address_pool" "poolad" {
  loadbalancer_id = azurerm_lb.lb_test.id
  name            = "test_back"
}
resource "azurerm_network_interface" "nic" {
  name                = "niccard8"
  resource_group_name = "rajeev-todo"
  location            = "East Asia"

  ip_configuration {
    name                          = "niccard"
    subnet_id                     = "/subscriptions/fbd449d7-51e0-4eee-89b4-98e7bdf04521/resourceGroups/rajeev-todo/providers/Microsoft.Network/virtualNetworks/rajeev-network1/subnets/subnet_fronted"
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_interface_backend_address_pool_association" "todoapp_lbnicascn" {
  network_interface_id    = azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = "niccard"
  backend_address_pool_id = azurerm_lb_backend_address_pool.poolad.id
}

resource "azurerm_lb_probe" "raj_probe" {
  loadbalancer_id     = azurerm_lb.lb_todoapp.id
  name                = probename
  port                = port
  protocol            = protocol
  interval_in_seconds = interval
}

resource "azurerm_lb_rule" "rule" {
  loadbalancer_id                = "/subscriptions/fbd449d7-51e0-4eee-89b4-98e7bdf04521/resourceGroups/rajeev-todo/providers/Microsoft.Network/loadBalancers/TestLoadBalancer"
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "testip"
  probe_id                       = azurerm_lb_probe.raj_probe.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.poolad.id]

}
