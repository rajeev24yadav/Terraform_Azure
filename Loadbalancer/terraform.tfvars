test_balancer = {
  "load" = {
    name                           = "loadbalancer"
    location                       = "east asia"
    rg                             = "rajeev-todo"
    name1                          = "LBRule"
    protocol                       = "Tcp"
    frontend_port                  = 80
    backend_port                   = 80
    frontend_ip_configuration_name = "PublicI"
    sku                            = "Standard"


    vmname  = "linuxvm"
    network = "niccard1"

    vmname  = "linuxvm1"
    network = "niccard3"


  }

}