variable "base_image" {
  default = "ubuntu-cloud.vdi"
}

variable "private_key_path" {
  default = "~/.ssh/id_rsa"
}

variable "vms" {
  type = list(object({
    name = string
    net1 = string
    ip1  = string
    net2 = string
    ip2  = string
  }))
}
