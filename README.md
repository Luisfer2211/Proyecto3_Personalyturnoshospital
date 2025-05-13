# Proyecto 3 - Control de Personal y Turnos en un Hospital

## Descripción
Este sistema permite gestionar la asignación de turnos y el control de personal en un hospital. Facilita la administración de horarios de trabajo, registro de empleados, supervisión de cambios de turno y generación de reportes en tiempo real.

## Integrantes
- Luis Palacios
- Pablo Cabrera
- José Sánchez

## Tecnologías Utilizadas
- **Backend:**
  - Node.js con Express
  - PostgreSQL
- **Frontend:**
  - HTML, CSS y JavaScript
  - Axios, jsPDF y html2canvas
- **Infraestructura:**
  - Docker para contenerización

## Estructura del Proyecto
```
📂 Proyecto-3  
 ├── 📂 fase2  
 │   ├── 📜 ModeloEntidadRelación.pdf 
 ├── 📂 fase3  
 │   ├── 📜 create.sql                       # Script con las creaciones de tablas  
 │   ├── 📜 inserts.sql                      # Script con los inserts de prueba  
 ├── 📂 fase4  
 │   ├── 📂 backend  
 │   │   ├── 📂 src  
 │   │   │   ├── 📂 database  
 │   │   │   │   ├── 📜 db.js                # Configuración de la base de datos  
 │   │   │   │   ├── 📜 initDB.js            # Inicialización de la BD  
 │   │   │   ├── 📂 routes  
 │   │   │   │   ├── 📜 reportes.js          # Lógica para los reportes  
 │   │   ├── 📜 Dockerfile                   # Configuración para contenedor backend
 │   ├── 📂 frontend  
 │   │   ├── 📜 index.html                   # Interfaz gráfica principal  
 │   │   ├── 📂 js  
 │   │   │   ├── 📜 main.js                  # Funcionalidad del frontend  
 │   │   ├── 📜 Dockerfile                   # Configuración para contenedor frontend
 ├── 📜 README.md  
```

## Instalación y Configuración
1. Clonar el repositorio:
   ```sh
   git clone https://github.com/Luisfer2211/Proyecto3_Personalyturnoshospital.git
   ```
2. Poder acceder al proyecto:
   - Entrar a la carpeta "Fase4" 
   - Ejecutar el comando
    ```bash
     docker-compose up --build

Esto ejecutará tanto el backend como el frontend. El backend estará disponible en `http://localhost:3000` y el frontend en `http://localhost`



## Funcionalidades Principales
- **Gestión de Turnos:** Permite asignar turnos al personal y consultar su historial.
- **Reportes:** Generación de reportes en formatos Excel y PDF.
- **Gestión de Incidencias:** Consulta de incidencias laborales.
- **Interfaz Web:** Sistema sencillo e intuitivo para operar desde el navegador.


## Estructura del Proyecto
El proyecto está dividido en dos componentes principales:
1. **Backend:** Gestión de lógica de negocio, conexión con la base de datos y APIs REST.
2. **Frontend:** Interfaz gráfica para los usuarios finales.
