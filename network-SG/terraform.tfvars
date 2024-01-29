nsgroup = {
  "network" = {
    name     = "sg-vm"
    location = "east asia"
    rg       = "rajeev-todo"
  }
  "network1" = {
    name     = "sg-test"
    location = "east asia"
    rg       = "rajeev-todo"
  }
}

  rajeev = {
  sg1 = {
    name = "first"
    priority = "100"
    port = "22"
    access = "Allow"
  },
  sg2 = {
    name = "second"
    priority = "101"
    port = "80"
    access = "Allow"
  },
  sg3 = {
    name = "third"
    priority = "102"
    port = "8843"
    access = "Allow"
  }
}

