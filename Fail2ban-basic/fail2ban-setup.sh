#!/bin/bash

# ==========================================================
# SCRIPT: fail2ban-setup.sh
# DESCRIPCIÓN:
#   Instala y configura Fail2Ban para proteger el servicio
#   SSH contra ataques de fuerza bruta.
#
#   - Configura una jail personalizada para SSH
#   - Define intentos máximos y tiempo de baneo
#   - Reinicia el servicio y verifica su estado
#   - Genera un log de ejecución
#
# AUTOR: Manuel Míguez
# ==========================================================


# ----- VARIABLES DE CONFIGURACIÓN -----
SSH_PORT=22
MAX_RETRY=5
FIND_TIME=600
BAN_TIME=3600
LOGFILE="$(dirname "$0")/fail2ban-setup.log"


# ----- FUNCIÓN DE LOG -----
log() {
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$TIMESTAMP - $1" | tee -a "$LOGFILE"
}


# ----- COMPROBAR EJECUCIÓN COMO ROOT -----
if [[ "$EUID" -ne 0 ]]; then
    log "ERROR: Este script debe ejecutarse como root."
    exit 1
fi


# ----- INSTALACIÓN DE FAIL2BAN -----
if ! command -v fail2ban-client >/dev/null 2>&1; then
    log "Fail2Ban no está instalado. Instalando..."
    apt update && apt install -y fail2ban
else
    log "Fail2Ban ya está instalado."
fi


# ----- CREACIÓN DE CONFIGURACIÓN LOCAL -----
log "Creando configuración jail.local..."

cat <<EOF > /etc/fail2ban/jail.local
[sshd]
enabled = true
port = $SSH_PORT
filter = sshd
logpath = /var/log/auth.log
maxretry = $MAX_RETRY
findtime = $FIND_TIME
bantime = $BAN_TIME
EOF


# ----- REINICIAR SERVICIO FAIL2BAN -----
log "Reiniciando servicio Fail2Ban..."
systemctl restart fail2ban


# ----- COMPROBAR ESTADO DEL SERVICIO -----
log "Comprobando estado de Fail2Ban..."
systemctl status fail2ban --no-pager | tee -a "$LOGFILE"


# ----- MOSTRAR ESTADO DE LA JAIL SSH -----
log "Estado de la jail SSH:"
fail2ban-client status sshd | tee -a "$LOGFILE"


log "Configuración de Fail2Ban completada correctamente."
