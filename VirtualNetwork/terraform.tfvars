rajeev_vnet = {
  "vnet" = {
    name          = "rajeev-network"
    location      = "east asia"
    rg            = "rajeev-todo"
    address_space = ["10.0.0.0/16"]
  }
  "vnet1" = {
    name          = "rajeev-network1"
    location      = "east asia"
    rg            = "rajeev-todo"
    address_space = ["20.0.0.0/16"]
  }
   "vnet2" = {
    name          = "rajeev-network2"
    location      = "east asia"
    rg            = "rajeev-todo"
    address_space = ["172.168.0.0/16"]
  }
}
rajsubnet = {
  subnet1 = {
    name           = "subnet8"
    address_prefix = "10.0.6.0/24"

  }
  subnet2 = {
    name           = "subnet6"
    address_prefix = "10.0.7.0/24"

  }
 }