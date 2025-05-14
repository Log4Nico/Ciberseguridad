provider "virtualbox" {

}

# Sección de las redes.
# Vamos a crear 3 redes

# Red 1 10.10.10.0/24
resource "virtualbox_hostonly" "red_10" {
  name       = "red10"
  ip_address = "10.10.10.1"
  netmask    = "255.255.255.0"
}

# Red 2 10.10.20.0/24
resource "virtualbox_hostonly" "red_20" {
  name       = "red20"
  ip_address = "10.10.20.1"
  netmask    = "255.255.255.0"
}

# Red 3 10.10.30.0/24
resource "virtualbox_hostonly" "red_30" {
  name       = "red30"
  ip_address = "10.10.30.1"
  netmask    = "255.255.255.0"
}

# Sección de las redes.
# PC1 - red1 + NAT 
resource "virtualbox_vm" "pc1" {
  name   = "pc1"
  image  = "ubuntu.box" 

  network_adapter {
    type           = "hostonly"
    host_interface = virtualbox_hostonly.red_10.name
  }

  network_adapter {
    type = "nat"
  }
}

# PC2 - red1 y red2
resource "virtualbox_vm" "pc2" {
  name  = "pc2"
  memory = var.vm_memory
  cpus   = var.vm_cpus

  network_adapter {
    type           = "hostonly"
    host_interface = virtualbox_hostonly.red_10.name
  }

  network_adapter {
    type           = "hostonly"
    host_interface = virtualbox_hostonly.red_20.name
  }
}

# PC3 - red2
resource "virtualbox_vm" "pc3" {
  name  = "pc3"
  memory = var.vm_memory
  cpus   = var.vm_cpus

  network_adapter {
    type           = "hostonly"
    host_interface = virtualbox_hostonly.red_20.name
  }
}

# PC4 - red1 y red3
resource "virtualbox_vm" "pc4" {
  name  = "pc4"
  memory = var.vm_memory cpus   = var.vm_cpus

  network_adapter {
    type           = "hostonly"
    host_interface = virtualbox_hostonly.red_10.name
  }

  network_adapter {
    type           = "hostonly"
    host_interface = virtualbox_hostonly.red_30.name
  }
}

# PC5 - red3
resource "virtualbox_vm" "pc5" {
  name  = "pc5"
  memory = var.vm_memory
  cpus   = var.vm_cpus

  network_adapter {
    type           = "hostonly"
    host_interface = virtualbox_hostonly.red_30.name
  }
}
