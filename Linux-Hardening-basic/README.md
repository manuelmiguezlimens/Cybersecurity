# 🔐 Linux Hardening Basic

Laboratorio práctico de **endurecimiento básico de un servidor Linux**, enfocado a aplicar buenas prácticas de seguridad mediante **automatización con Bash**.

Este laboratorio simula tareas reales realizadas por administradores de sistemas y técnicos de redes en entornos profesionales.

---

## 🎯 Objetivos del laboratorio.

- Asegurar el acceso remoto al servidor mediante **hardening de SSH**.
- Proteger el sistema con un **firewall UFW** correctamente configurado.
- Automatizar tareas críticas de seguridad.
- Generar logs de ejecución para auditoría y trazabilidad.

---

## 📁 Estructura del laboratorio

```text
linux-hardening-basic/
|
├── ssh-hardening.sh
├── ufw-hardening.sh
└── README.md 
```
----

## 🔑 ssh-hardenind.sh
Script encargado de aplicar configuraciones seguras al servicio SSH, tales como:

- Desactivar el acceso directo del usuario ```root```.
- Forzar autenticación segura. 
- Ajustar parámetros para reducir ataques de fuerza bruta.
- Reiniciar el servicio SSH de forma controlada.
- Generar un log de los cambios realizados.

👉 ***IMPORTANTE***: Se recomienda ejecutar este script antes de configurar el firewall.

---

## 🔥 ufw-hardening.sh
Script de configuración básica del **firewall UFW**, aplicando el principio de mínima exposición:

- Política por defecto:

    - ❌ Denegar tráfico entrante.
    - ✅ Permitir tráfico saliente.

- Permitir acceso por SSH en un puerto configurable.
- Activar UFW de forma segura.
- Mostrar y registrar el estado final del firewall.

---

## ▶️ Uso

Ejecutar ambos scripts con privilegios de administrador:

``` 
sudo bash ssh-hardening.sh
sudo bash ufw-hardening.sh
```

Comprobar estado del firewall:

``` 
sudo ufw status verbose
```

---

## 📄 Logs

Cada script genera su propio archivo de log en el mismo directorio:

- ```ssh-hardening.log```
- ```ufw-hardening.log```

Estos logs permiten revisar cambios y facilitar tareas de auditoría o troubleshooting.

---

## ⚠️ Advertencias

- Asegúrate de no perder acceso remoto antes de aplicar cambios.
- Verifica el puerto SSH configurado antes de activar UFW.
- Este laboratorio está pensado para **entornos de pruebas o aprendizaje**

---
## 🚀 Tecnolgías utilizadas
- Bash
- OpenSSH.
- UFW
- Linux

---
## 👤 Autor

**Manuel Míguez**

[GitHub](https://github.com/manuelmiguezlimens) || [LinkedIn](https://www.linkedin.com/in/manuelmiguezlimens/) || [Gmail](mailto:miguezlimensmanuel@gmail.com)