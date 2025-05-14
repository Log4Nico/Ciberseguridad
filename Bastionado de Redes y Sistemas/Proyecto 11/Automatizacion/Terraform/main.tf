# Crear el proyecto GNS3
resource "gns3_project" "network_project" {
  name = var.project_name
}

# Crear NAT1 (nodo cloud)
resource "gns3_cloud" "nat1" {
  project_id = gns3_project.network_project.id
  name       = "NAT1"
  x          = var.node_positions.nat.x
  y          = var.node_positions.nat.y
}

# Obtener ID del template de pfSense
data "gns3_template_id" "pfsense_template" {
  name = var.pfsense_template
}

# Crear firewall pfSense
resource "gns3_template" "pfsense" {
  project_id  = gns3_project.network_project.id
  template_id = data.gns3_template_id.pfsense_template.id
  name        = "pfSense-2.7.0-1"
  compute_id  = "local"
  x           = var.node_positions.pfsense.x
  y           = var.node_positions.pfsense.y
}

# Crear Switch1
resource "gns3_switch" "switch1" {
  project_id = gns3_project.network_project.id
  name       = "Switch1"
  x          = var.node_positions.switch.x
  y          = var.node_positions.switch.y
}

# Obtener ID del template para PCs
data "gns3_template_id" "pc_template" {
  name = var.pc_template
}

# Crear Admin PC
resource "gns3_template" "admin" {
  project_id  = gns3_project.network_project.id
  template_id = data.gns3_template_id.pc_template.id
  name        = "Admin"
  compute_id  = "local"
  x           = var.node_positions.admin.x
  y           = var.node_positions.admin.y
}

# Crear PC1
resource "gns3_template" "pc1" {
  project_id  = gns3_project.network_project.id
  template_id = data.gns3_template_id.pc_template.id
  name        = "PC1"
  compute_id  = "local"
  x           = var.node_positions.pc1.x
  y           = var.node_positions.pc1.y
}

# Crear PC2
resource "gns3_template" "pc2" {
  project_id  = gns3_project.network_project.id
  template_id = data.gns3_template_id.pc_template.id
  name        = "PC2"
  compute_id  = "local"
  x           = var.node_positions.pc2.x
  y           = var.node_positions.pc2.y
}

# Conexión entre NAT1 y pfSense
resource "gns3_link" "nat_to_pfsense" {
  project_id     = gns3_project.network_project.id
  node_a_id      = gns3_cloud.nat1.id
  node_a_adapter = 0
  node_a_port    = 0
  node_b_id      = gns3_template.pfsense.id
  node_b_adapter = 0
  node_b_port    = 0
}

# Conexión entre pfSense y Switch1
resource "gns3_link" "pfsense_to_switch" {
  project_id     = gns3_project.network_project.id
  node_a_id      = gns3_template.pfsense.id
  node_a_adapter = 1
  node_a_port    = 0
  node_b_id      = gns3_switch.switch1.id
  node_b_adapter = 0
  node_b_port    = 0
}

# Conexión entre Switch1 y Admin
resource "gns3_link" "switch_to_admin" {
  project_id     = gns3_project.network_project.id
  node_a_id      = gns3_switch.switch1.id
  node_a_adapter = 0
  node_a_port    = 1
  node_b_id      = gns3_template.admin.id
  node_b_adapter = 0
  node_b_port    = 0
}

# Conexión entre Switch1 y PC1
resource "gns3_link" "switch_to_pc1" {
  project_id     = gns3_project.network_project.id
  node_a_id      = gns3_switch.switch1.id
  node_a_adapter = 0
  node_a_port    = 2
  node_b_id      = gns3_template.pc1.id
  node_b_adapter = 0
  node_b_port    = 0
}

# Conexión entre Switch1 y PC2
resource "gns3_link" "switch_to_pc2" {
  project_id     = gns3_project.network_project.id
  node_a_id      = gns3_switch.switch1.id
  node_a_adapter = 0
  node_a_port    = 3
  node_b_id      = gns3_template.pc2.id
  node_b_adapter = 0
  node_b_port    = 0
}

# Iniciar todos los nodos después de la creación
resource "gns3_start_all" "start_project" {
  project_id = gns3_project.network_project.id
  depends_on = [
    gns3_link.nat_to_pfsense,
    gns3_link.pfsense_to_switch,
    gns3_link.switch_to_admin,
    gns3_link.switch_to_pc1,
    gns3_link.switch_to_pc2
  ]
}
