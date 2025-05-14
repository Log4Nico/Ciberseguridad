variable "vm_box" {
  description = "Nombre de la box base de VirtualBox"
  type        = string
  default     = "ubuntu.box"
}

variable "vm_memory" {
  description = "Memoria RAM para las VMs (en MB)"
  type        = number
  default     = 1024
}

variable "vm_cpus" {
  description = "Número de CPUs para las VMs"
  type        = number
  default     = 1
}
