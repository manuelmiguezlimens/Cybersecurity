# 🛡️ SSH Telegram Guardian

Un script proactivo en Python diseñado para la monitorización en tiempo real de la seguridad en servidores Linux. Actúa como un sistema de alerta temprana, notificando instantáneamente a un chat privado de Telegram cada vez que se detecta un intento de acceso SSH (tanto exitoso como fallido).

Ideal para administradores de sistemas (SysAdmins) y entusiastas de la ciberseguridad que buscan proteger sus laboratorios o servidores domésticos sin desplegar infraestructuras pesadas de SIEM.

---

## ✨ Características

* **Monitorización en tiempo real:** Analiza el archivo de logs del sistema simulando el comportamiento de un comando `tail -f`.
* **Alertas visuales detalladas:** Envía mensajes formateados a Telegram incluyendo el estado del acceso, el usuario implicado y la dirección IP de origen.
* **Consumo mínimo de recursos:** Desarrollado utilizando únicamente la librería nativa `requests` de Python, optimizando el rendimiento del servidor.

---

## 🛠️ Requisitos previos

Antes de desplegar el script, asegúrate de contar con lo siguiente:

1. **Entorno:** Un servidor basado en Linux (Ubuntu/Debian recomendado).
2. **Python:** Python 3.x instalado en el sistema.
3. **Dependencias:** La librería `requests` para interactuar con la API de Telegram.
   ```bash
   pip install requests
   ```

---

## 🚀 Configuración paso a paso
1. Crear el Bot de Telegram

    Abre Telegram y busca al usuario oficial @BotFather.

    Envía el comando /newbot y sigue los pasos para asignarle un nombre y un usuario a tu bot.

    Copia el Token HTTP API que te proporcionará al finalizar.

    Busca al usuario @userinfobot en Telegram, dale a iniciar (/start) y copia tu ID numérico de usuario.

    **¡Crucial!** Entra en el chat de tu nuevo bot y pulsa el botón Iniciar o escribe /start. De lo contrario, Telegram bloqueará los mensajes del script.

2. Clonar y configurar el script

    Clona este repositorio o descarga el archivo guardian.py en tu servidor. Abre el archivo y edita la sección de configuración con tus credenciales:
    ````
    --- CONFIGURACIÓN ---
    TOKEN = "TU_TOKEN_DE_BOTFATHER_AQUÍ"
    CHAT_ID = "TU_ID_DE_USUARIO_AQUÍ"
    LOG_FILE = "/var/log/auth.log"  # Usa /var/log/secure si estás en CentOS/RHEL ```
3. Ejecución

    Debido a que los archivos de logs de autenticación están protegidos por el sistema operativo, es necesario ejecutar el script con privilegios de administrador (sudo o root):

    ```sudo python3 guardian.py```

---

## 👤 Autor

Manuel Míguez Liméns

[GitHub](https://github.com/manuelmiguezlimens) || [LinkedIn](https://www.linkedin.com/in/manuelmiguezlimens/) || [Gmail](mailto:miguezlimensmanuel@gmail.com)
