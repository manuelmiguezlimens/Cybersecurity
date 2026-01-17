#!/bin/bash

# ============================================================
# Script: ssh-hardening.sh
# Descripción: Aplica hardening básico al servicio SSH
# Autor: Manuel Míguez Liméns
# ============================================================

# ----- Variables de configuración -----
SSH_CONFIG="/etc/ssh/sshd_config"
BACKUP_FILE="/etc/ssh/sshd_config.bak"
LOGFILE="$(pwd)/ssh-hardening.log"
NEW_PORT=2222     # Puerto SSH personalizado

# ----- Comprobar ejecución como root -----
if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse como root"
    exit 1
fi

# ----- Crear log -----
touch "$LOGFILE"
echo "--------------------------------------------------" >> "$LOGFILE"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Inicio de hardening SSH" >> "$LOGFILE"

# ----- Backup del archivo de configuración -----
if [ ! -f "$BACKUP_FILE" ]; then
    cp "$SSH_CONFIG" "$BACKUP_FILE"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup creado en $BACKUP_FILE" >> "$LOGFILE"
fi

# ----- Aplicar configuraciones de seguridad -----
sed -i "s/^#Port .*/Port $NEW_PORT/" "$SSH_CONFIG"
sed -i "s/^Port .*/Port $NEW_PORT/" "$SSH_CONFIG"

sed -i "s/^#PermitRootLogin .*/PermitRootLogin no/" "$SSH_CONFIG"
sed -i "s/^PermitRootLogin .*/PermitRootLogin no/" "$SSH_CONFIG"

sed -i "s/^#PasswordAuthentication .*/PasswordAuthentication no/" "$SSH_CONFIG"
sed -i "s/^PasswordAuthentication .*/PasswordAuthentication no/" "$SSH_CONFIG"

sed -i "s/^#PubkeyAuthentication .*/PubkeyAuthentication yes/" "$SSH_CONFIG"
sed -i "s/^PubkeyAuthentication .*/PubkeyAuthentication yes/" "$SSH_CONFIG"

sed -i "s/^#ClientAliveInterval .*/ClientAliveInterval 300/" "$SSH_CONFIG"
sed -i "s/^#ClientAliveCountMax .*/ClientAliveCountMax 2/" "$SSH_CONFIG"

echo "$(date '+%Y-%m-%d %H:%M:%S') - Configuración SSH aplicada" >> "$LOGFILE"

# ----- Reiniciar servicio SSH -----
systemctl restart sshd

if [ $? -eq 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Servicio SSH reiniciado correctamente" >> "$LOGFILE"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR al reiniciar SSH" >> "$LOGFILE"
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - Hardening SSH finalizado" >> "$LOGFILE"
