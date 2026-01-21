# 🔍 Lynis Audit Basic

Laboratorio práctico de **auditoría de seguridad en sistemas Linux** utilizando **Lynis**, una de las herramientas más utilizadas para evaluar el estado de seguridad y cumplimiento de un sistema.

Este laboratorio está orientado a **entornos reales de administración de sistemas y redes**, aplicando auditorías defensivas sin afectar al funcionamiento del sistema.

---

## 🎯 Objetivos del laboratorio

- Realizar una aditoría básica de seguridad en un sistema Linux.

- Identificar configuraciones inseguras o mejorables.

- Generar reportes y logs de auditoria.

- Automatizar el proceso de análisis.

- Interpretar avisos y sugerencias de seguridad.

---

## 📁 Estructura del laboratorio

```
Lynis-audit-basic/
├── lynis-audit.sh
├── lynis-audit.log
├── reports/
│   ├── lynis-full.log
│   └── lynis-report.dat
└── README.md
```

---

## 🧠 ¿Qué es Lynis?

[Lynis](https://keepcoding.io/blog/que-es-lynis/#:~:text=Lynis%20es%20una%20herramienta%20de,o%20problemas%20en%20el%20mismo.) es una herramienta de auditoría de seguridad para sistemas Unix/Linux que analiza:

Configuración del sistema

Servicios activos

Permisos y usuarios

Firewall y red

Prácticas de seguridad generales

Genera avisos (warnings) y sugerencias (suggestions) para mejorar la seguridad del sistema.

---

## 🔧 Script: ```lynis-audit.sh```

Este script automatiza todo el proceso de auditoría:

- Comprueba que se ejecuta como ```root```

- Instala Lynis si no está presente.

- Ejecuta una auditoría rápida del sistema

- Guarda reportes y logs en un directorio local

- Muestra un resumen de avisos y sugerencias.

--- 

## ▶️ Uso

Ejecutar el script con privilegios de administrador:

```
sudo bash lynis-audit.sh
```

---

## 📄 Resultados y reportes
Tras la ejecución se generan los siguientes archivos:

- ```lynis-audit.log``` → log del script

- ```reports/lynis-full.log``` → log completo de lynis

- ```reports/lynis-report.dat``` → reporte estructurado de auditoría

Estos archivos permiten:

- Revisar el estado de seguridad del sistema.

- Comparar auditorías en el tiempo

- Documentar mejoras aplicadas

---

## 🎥 Vídeo de demostración

En este repositorio se incluye un vídeo de demostración donde se muestra:

Ejecución del script

Generación de reportes

Interpretación básica de resultados

👉 Puedes ver el vídeo aquí:

📺 [Ver demostración del laboratorio](Cibersecurity\Lynis-Audit-Basic\demo.mp4)

_(El vídeo se encuentra en el mismo repositorio)_

---

## 👤 Autor

Manuel Míguez Liméns

[GitHub](https://github.com/manuelmiguezlimens) | [LinkedIn](https://www.linkedin.com/in/manuelmiguezlimens/) | [Gmail](mailto:miguezlimensmanuel@gmail.com)