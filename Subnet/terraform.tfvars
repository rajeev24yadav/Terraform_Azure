raj_subnet = {
  "subnetfront1" = {
    name                 = "subnet_fronted"
    resource_group_name  = "rajeev-todo"
    virtual_network_name = "rajeev-network1"
    address_prefixes     = ["20.0.4.0/24"]
  }
  "sbackend1" = {
    name                 = "subnet_backend"
    resource_group_name  = "rajeev-todo"
    virtual_network_name = "rajeev-network"
    address_prefixes     = ["10.0.5.0/24"]
  }
  "besttion" = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rajeev-todo"
    virtual_network_name = "rajeev-network1"
    address_prefixes     = ["20.0.6.0/24"]
  }
}