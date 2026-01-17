#!/bin/bash

# ==========================================================
# SCRIPT: ufw-hardening.sh
# DESCRIPCIÓN:
#   Configura un firewall básico con UFW aplicando
#   políticas seguras para un servidor Linux.
#
#   - Deniega todo el tráfico entrante
#   - Permite todo el tráfico saliente
#   - Permite SSH en un puerto configurable
#   - Genera un log de ejecución
#
# AUTOR: Manuel Míguez
# ==========================================================


# ----- VARIABLES DE CONFIGURACIÓN -----
SSH_PORT=22
LOGFILE="$(dirname "$0")/ufw-hardening.log"


# ----- FUNCIÓN PARA LOG -----
log() {
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$TIMESTAMP - $1" | tee -a "$LOGFILE"
}


# ----- COMPROBAR SI SE EJECUTA COMO ROOT -----
if [[ "$EUID" -ne 0 ]]; then
    log "ERROR: Este script debe ejecutarse como root."
    exit 1
fi


# ----- COMPROBAR SI UFW ESTÁ INSTALADO -----
if ! command -v ufw >/dev/null 2>&1; then
    log "UFW no está instalado. Instalando..."
    apt update && apt install -y ufw
fi


# ----- CONFIGURACIÓN INICIAL DE UFW -----
log "Estableciendo políticas por defecto..."
ufw default deny incoming
ufw default allow outgoing


# ----- PERMITIR SSH -----
log "Permitiendo SSH en el puerto $SSH_PORT..."
ufw allow "$SSH_PORT"/tcp


# ----- ACTIVAR UFW -----
log "Activando UFW..."
ufw --force enable


# ----- MOSTRAR ESTADO FINAL -----
log "Estado final del firewall:"
ufw status verbose | tee -a "$LOGFILE"


log "Configuración de UFW completada correctamente."
