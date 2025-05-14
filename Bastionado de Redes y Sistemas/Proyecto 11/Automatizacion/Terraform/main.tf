provider "virtualbox" {
  version = "0.2.2"
}

locals {
  pcs = [
    {
      name   = "pc1"
      ip1    = "192.168.68.110"
      ip2    = "10.10.10.128"
      nics   = [0, 1]
    },
    {
      name   = "pc2"
      ip1    = "10.10.10.129"
      ip2    = "10.10.20.135"
      nics   = [1, 2]
    },
    {
      name   = "pc3"
      ip1    = "10.10.20.136"
      ip2    = null
      nics   = [2]
    },
    {
      name   = "pc4"
      ip1    = "10.10.10.130"
      ip2    = "10.10.30.140"
      nics   = [1, 3]
    },
    {
      name   = "pc5"
      ip1    = "10.10.30.141"
      ip2    = null
      nics   = [3]
    }
  ]
}

resource "virtualbox_vm" "pc" {
  count = length(local.pcs)

  name      = local.pcs[count.index].name
  image     = "${path.module}/ubuntu-cloud.vdi"
  cpus      = 1
  memory    = "1024 mib"

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet${local.pcs[count.index].nics[0]}"
  }

  dynamic "network_adapter" {
    for_each = local.pcs[count.index].nics[1] != null ? [1] : []
    content {
      type           = "hostonly"
      host_interface = "vboxnet${local.pcs[count.index].nics[1]}"
    }
  }

  ssh_username = "ubuntu"
  ssh_private_key = file("${path.module}/id_rsa")

  provisioner "remote-exec" {
    inline = [
      "echo 'Configurando IPs estáticas...'",
      "sudo bash /tmp/setup-net.sh"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/id_rsa")
      host        = local.pcs[count.index].ip1
    }
  }

  provisioner "file" {
    source      = "${path.module}/scripts/setup-net.sh"
    destination = "/tmp/setup-net.sh"
  }
}
