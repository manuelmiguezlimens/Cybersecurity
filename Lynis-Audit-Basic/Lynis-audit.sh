#!/bin/bash

# ==========================================================
# SCRIPT: lynis-audit.sh
# DESCRIPCIÓN:
#   Realiza una auditoría básica de seguridad en sistemas
#   Linux utilizando la herramienta Lynis.
#
#   - Instala Lynis si no está presente
#   - Ejecuta una auditoría completa del sistema
#   - Guarda el reporte y los avisos en archivos locales
#   - Genera un log de ejecución
#
# AUTOR: Manuel Míguez
# ==========================================================


# ----- VARIABLES DE CONFIGURACIÓN -----
WORKDIR="$(dirname "$0")"
REPORT_DIR="$WORKDIR/reports"
LOGFILE="$WORKDIR/lynis-audit.log"


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


# ----- CREAR DIRECTORIO DE REPORTES -----
mkdir -p "$REPORT_DIR"


# ----- COMPROBAR SI LYNIS ESTÁ INSTALADO -----
if ! command -v lynis >/dev/null 2>&1; then
    log "Lynis no está instalado. Instalando..."
    apt update && apt install -y lynis
else
    log "Lynis ya está instalado."
fi


# ----- EJECUTAR AUDITORÍA -----
log "Iniciando auditoría de seguridad con Lynis..."

lynis audit system \
    --quick \
    --log-file "$REPORT_DIR/lynis-report.log" \
    --report-file "$REPORT_DIR/lynis-report.dat"


# ----- COPIAR ARCHIVOS DE RESULTADO -----
cp /var/log/lynis.log "$REPORT_DIR/lynis-full.log" 2>/dev/null
cp /var/log/lynis-report.dat "$REPORT_DIR/lynis-report.dat" 2>/dev/null


# ----- MOSTRAR RESUMEN EN CONSOLA -----
log "Auditoría finalizada."
log "Resumen de avisos y sugerencias:"

grep -E "warning|suggestion" /var/log/lynis.log | tee -a "$LOGFILE"


log "Los reportes se han guardado en: $REPORT_DIR"
log "Auditoría de seguridad completada correctamente."
