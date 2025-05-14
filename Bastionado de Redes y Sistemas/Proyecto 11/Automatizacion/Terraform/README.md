# Proyecto Terraform - Infraestructura VirtualBox

Este entorno reproduce una red segmentada con varios PCs conectados a distintas subredes, tal como se especifica en el proyecto de emulación de adversarios.

## Requisitos

- VirtualBox
- Plugin `terraform-provider-virtualbox`
- Terraform ≥ 1.0

## Estructura

- `main.tf`: configuración principal
- `scripts/setup-net.sh`: script de configuración de red (provisional)
- `id_rsa` / `id_rsa.pub`: claves SSH para provisioning
- `ubuntu-cloud.vdi`: imagen base (no incluida)

## Notas

Este entorno está pensado como base para pruebas con herramientas como Infection Monkey, CALDERA, etc.
