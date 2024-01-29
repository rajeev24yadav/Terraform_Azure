lbname             = "lb-todoapp"
backendpool        = "todoapp_backendpool"
backendpooladdress = "todoapp_backendaddress"

vms = {
  "vm-rajeevfronted1" = {
    vmname                 = "linuxvm"
    network_interface_name = "niccard1"
  },
  "vm-rajeevfronted2" = {
    vmname                 = "linuxvm1"
    network_interface_name = "niccard3"
  }
}

probename = "frontendprobe"
port      = "80"
protocol  = "Tcp"
interval  = "5"

lbrule       = "frontendrule"
frontendport = "80"
backendport  = "80"
