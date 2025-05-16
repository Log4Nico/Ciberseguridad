output "project_id" {
  description = "ID del proyecto GNS3 creado"
  value       = gns3_project.network_project.id
}

output "project_name" {
  description = "Nombre del proyecto GNS3 creado"
  value       = gns3_project.network_project.name
}

output "nat1_id" {
  description = "ID del nodo NAT1"
  value       = gns3_cloud.nat1.id
}

output "pfsense_id" {
  description = "ID del firewall pfSense"
  value       = gns3_template.pfsense.id
}

output "switch1_id" {
  description = "ID del Switch1"
  value       = gns3_switch.switch1.id
}
