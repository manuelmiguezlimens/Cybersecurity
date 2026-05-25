# Importamos las librerias
import time
import os
import requests

# --- CONFIGURACION ---
token = "8890533126:AAHFcO2OF4GDdD3ZsfYLjCIte6_DU8jVdBI"
chat_id = "8584471777"
archivo_log = "/var/log/auth.log"

# --- FUNCION PARA ENVIAR EL MENSAJE A TELEGRAM ---
def enviar_telegram(mensaje):
    url = f"https://api.telegram.org/bot{token}/sendMessage"
    playload = {
        "chat_id": chat_id,
        "text": mensaje,
        "parse_mode": "Markdown"
    }
    try:
        requests.post(url, json=playload)
    except Exception as e:
        print(f"Error al enviar a Telegram: {e}")

# --- FUNCION PARA MONOTORIZAR LOS LOGS ---
def monitorizar_logs():
    print("El guardián está activado y vigilando...")
    # Abrimos el archivo y nos vamos al final
    with open(archivo_log, "r") as f:
        f.seek(0, os.SEEK_END)
        while True:
            linea = f.readline()
            if not linea:
                time.sleep(1) # Espera un segundo si no ha líneas nuevas
                continue
            # Analizamos la linea en bisca de eventos SSH
            if "sshd" in linea:
                if "Accepted" in linea:
                    # Inicio de sesion correcto
                    partes = linea.split()
                    usuario = partes[partes.index("for")+1]
                    ip = partes[partes.index("from")+1]
                    msg = f"🔓 *Acceso SSH Permitido*\n👤 *Usuario:* `{usuario}`\n🌐 *IP:* `{ip}`"
                    enviar_telegram(msg)
                elif "Failed" in linea:
                    # Intento de inicio de sesión fallido
                    partes = linea.split()
                    usuario = partes[partes.index("for") + 1]
                    ip = partes[partes.index("from") + 1]
                    msg = f"🚨 *ALERTA: Intento SSH Fallido*\n👤 *Usuario:* `{usuario}`\n🌐 *IP:* `{ip}`"
                    enviar_telegram(msg)

# --- EJECUCION DEL PROGRAMA ---
if __name__ == "__main__":
    # Recuerda ejecutar este script como sudo, ya que auth.log requiere permisos de root
    monitorizar_logs()