variable "project_name" {
  description = "Nombre del proyecto GNS3"
  type        = string
  default     = "Proyecto-Automatizado"
}

variable "pfsense_template" {
  description = "Nombre del template de pfSense"
  type        = string
  default     = "pfsense"  # Asegúrate que este template existe en tu servidor GNS3
}

variable "pc_template" {
  description = "Nombre del template para los PCs"
  type        = string
  default     = "VPCS"  # Ajusta según el tipo de dispositivo que uses para PCs
}

# Coordenadas para posicionar los nodos en el diagrama
variable "node_positions" {
  type = map(map(number))
  default = {
    nat = {
      x = 0
      y = 0
    }
    pfsense = {
      x = 0
      y = 100
    }
    switch = {
      x = 0
      y = 200
    }
    admin = {
      x = -150
      y = 300
    }
    pc1 = {
      x = 0
      y = 300
    }
    pc2 = {
      x = 150
      y = 300
    }
  }
}
