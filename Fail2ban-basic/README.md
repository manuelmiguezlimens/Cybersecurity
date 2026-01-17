# 🛡️ Fail2Ban Basic - Protección SSH

Laboratorio práctico de **ciberseguridad defensiba (Blue Team)** enfocado en la instalación y configuraración de **Fail2Ban** para proteger servidores linux frente a ataques de fuerza bruta por **SSH**.

Este laboratorio reproduce una configuración **realista y habitual en entornos profesionales** de administración de sistemas y redes.

---

## 🎯 Objetivos del laboratorio

- Instalar y configurar Fail2Ban de forma automatizada
- Proteger el servicio SSH frente a intentos de acceso no autorizados
- Definir umbrales de intentos fallidos y tiempos de baneo
- Validar el correcto funcionamiento mediante pruebas controladas
- Generar logs para auditoría y troubleshooting

---

## 📁 Estructura del laboratorio

```text
fail2ban-basic/
├── fail2ban-setup.sh
├── Demo.mp4
└── README.md
```

---

## 🧠 ¿Qué es Fail2Ban?
[**Fail2Ban**](https://es.wikipedia.org/wiki/Fail2ban) es una herramienta de seguridad que analiza logs de sistema y **bloquea automáticamente direcciones IP** que muestran comportamientos sospechosos, como múltiples intentos fallidos de autenticación.

Se utiliza habitualmente para proteger servicios expuestos como:

- SSH
- Servidores web.
- FTP
- Servicios de correo.

---

## 🔧 Script: ```fail2ban-setup.sh```
Este script realiza las siguientes acciones:

- Comprueba que se ejecuta como root

- Instala Fail2Ban si no está presente

- Crea una configuración local (jail.local) para SSH

- Define:

    - Número máximo de intentos fallidos

    - Ventana de tiempo de detección

    - Tiempo de baneo

- Reinicia el servicio Fail2Ban

- Verifica el estado del servicio y de la jail SSH

- Genera un log de ejecución

---

## ▶️ Uso

Ejecutar el script con privilegios de administrador:

```
sudo bash fail2ban-setup.sh
```

Si quieres ver como funciona puedes reproducir el video haciendo click [aqui](Cibersecurity\Fail2ban-basic\Demo.mp4)

---
## 🔍 Verificación de funcionamiento

- Comprobación del estado del servicio ➝ ```sudo systemctl status fail2ban```

- Ver jails activas ➝ ```sudo fail2ban-client status```

- Ver esado de la jail SSH ➝ ```sudo fail2ban-client status sshd```

---
## 🧪 Prueba práctica (simulación de ataque)

Desde la misma máquina o desde otra:

```
ssh usuario@IP_SERVIDOR
````
Introduce una contraseña incorrecta varias veces hasta alcanzar el umbral configurado.

Si fail2ban funciona correctamente:

- La IP será baneada.

- La conexión será rechazada.

- El evento quedará registrado en los logs.

---
## 📄 Logs

- Log del script ➝ ```fail2ban-setup.log```

- Log de Fail2Ban ➝ ```/var/log/fail2ban.log```

Estos logs permiten revisar baneos, errores y eventos de seguridad.

---

## 🔄 Desbanear una IP (opcional)

```
sudo fail2ban-client set sshd unbanip IP_A_DESBANEAR
```
---

## ⚠️ Advertencias

- Este laboratorio está pensado para **entornos de prueba o aprendizaje**.

- Asegúrate de no perder el acceso remoto al servidor.

- En producción, se recomienda integrar el Fail2Ban con firewall (UFW/iptables/nftables)

---

## 👤 Autor

Manuel Míguez Liméns

[GitHub](https://github.com/manuelmiguezlimens) || [LinkedIn](https://www.linkedin.com/in/manuelmiguezlimens/) || [Gmail](mailto:miguezlimensmanuel@gmail.com)


