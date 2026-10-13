# 🚀 Paquete de Entrega & Traspaso Técnico: Ecosistema Tecnológico
**Proyectos:** Orbit (Middleware, Dashboard, MCP) | Temis (Web Suite, Media Studio) | Maxibot | Agentes IA  
**Departamento:** Sistemas & Desarrollo  
**Fecha de Entrega:** Octubre 2026  

---

## 🧭 1. Bienvenida y Arquitectura General

¡Bienvenido al ecosistema tecnológico! Este paquete contiene la suite completa de aplicaciones, integraciones y modelos de inteligencia artificial desarrollados para optimizar la gobernanza de procesos, la atención automatizada y la orquestación de servicios en tiempo real.

El paquete se encuentra organizado de forma **100% modular y sin credenciales embebidas (*Zero-Secrets*)**. Cada carpeta funciona de manera independiente y cuenta con sus scripts de arranque rápido y sus plantillas de variables de entorno `.env.example`.

```text
📦 Proyectos Innovacion Traspaso/
├── 📄 LEEME_PRIMERO.md                          <-- (Este archivo) Guía maestra de inicio
│
├── 📂 01_Orbit_Middleware/                      <-- Core Middleware (FastAPI, Webhooks Respond.io, Google Chat)
│   ├── .env.example
│   ├── render.yaml                             <-- Blueprint para Render Cloud
│   ├── requirements.txt
│   ├── api/ & shared/
│   └── Iniciar_Orbit_Local.bat                 <-- Doble clic para arrancar en local
│
├── 📂 02_Orbit_Dashboard/                       <-- Panel Web de Monitoreo en Tiempo Real (Reflex)
│   ├── .env.example
│   ├── rxconfig.py
│   ├── dashboard_reflex/
│   └── Iniciar_Dashboard_Local.bat             <-- Doble clic para levantar el dashboard
│
├── 📂 03_Orbit_MCP_Supabase/                    <-- Microservicio MCP Server para Supabase & Gemini
│   ├── .env.example
│   ├── Dockerfile
│   ├── main.py
│   └── Iniciar_MCP_Local.bat                   <-- Doble clic para arrancar el MCP
│
├── 📂 04_Temis_Web_Platform/                    <-- Suite Web de Procesos & Auditoría IA (Reflex + FastAPI)
│   ├── .env.example
│   ├── render.yaml                             <-- Blueprint para Render Cloud
│   ├── requirements.txt
│   ├── backend/ & temis_web/
│   ├── docs/ (Plantilla SIPOC & Backlog Scrum)
│   ├── modulo_gobernanza_legado/               <-- Código histórico y guía de reintegración de 7 fases
│   └── Iniciar_TEMIS_Local.bat                 <-- Doble clic para levantar la plataforma
│
├── 📂 05_Temis_Media_Studio/                    <-- App Desktop para Transcripción y Captura (Whisper + IA)
│   ├── .env.example
│   ├── main.py
│   ├── services/ & ui/
│   └── Iniciar_Media_Studio.bat                <-- Doble clic para abrir la app de escritorio
│
├── 📂 06_Maxibot_Desktop/                       <-- Asistente IA Desktop (Keycloak SSO, FAQs Google Sheets)
│   ├── .env.example
│   ├── keycloak-config/ (Configuraciones de Realm y Clientes)
│   ├── MaxiBot_V4.6.2_DevOpsMCP.py
│   └── Iniciar_Maxibot.bat                     <-- Doble clic para abrir Maxibot
│
└── 📂 07_Agentes_IA_Prompts/                    <-- Catálogo de Prompts y Configuración del Fleet de Agentes
    ├── Agente Orquestador/
    ├── Agente Comunicador/
    ├── Agente Estatus/
    ├── Agente Generador/
    ├── Agente Verificador/
    ├── Agente Derivacion Fraudes/
    └── README.md
```

---

## 🛠️ 2. Prerrequisitos de Software en tu Equipo

Antes de iniciar, asegúrate de tener instalado en tu computadora:

1. **Python 3.11 o 3.12**:
   - Descarga desde [python.org/downloads](https://www.python.org/downloads/).
   - ⚠️ **IMPORTANTE:** Durante la instalación, marca la casilla **"Add Python to PATH"**.
2. **Git**:
   - Descarga desde [git-scm.com](https://git-scm.com/).
3. **Editor de Código**:
   - Recomendado: [Visual Studio Code](https://code.visualstudio.com/) o Cursor.
4. **Node.js (LTS)** *(Requerido únicamente para compilar frontend de Reflex)*:
   - Descarga desde [nodejs.org](https://nodejs.org/).

---

## 🔑 3. Guía para Configurar tus Credenciales (API Keys)

Por políticas de seguridad, este paquete **no contiene claves de acceso personales ni secretos de producción**. Cada desarrollador o entorno debe configurar su propio archivo `.env`:

### A. Google Gemini API Key (IA)
1. Entra a [Google AI Studio](https://aistudio.google.com/).
2. Inicia sesión con tu cuenta de Google corporativa.
3. Haz clic en **Get API Key** ➔ **Create API Key**.
4. Copia tu llave y pégala en `GEMINI_API_KEY` en los archivos `.env` de:
   - `01_Orbit_Middleware`
   - `03_Orbit_MCP_Supabase`
   - `04_Temis_Web_Platform`
   - `05_Temis_Media_Studio`
   - `06_Maxibot_Desktop`

### B. Supabase (Base de Datos PostgreSQL & MCP)
1. Entra a [supabase.com](https://supabase.com/) e inicia sesión.
2. Accede a tu proyecto asignado.
3. En **Project Settings ➔ API**, copia:
   - **Project URL** ➔ `SUPABASE_URL`
   - **Project API Keys (anon public)** ➔ `SUPABASE_ANON_KEY` / `SUPABASE_KEY`

### C. Google Cloud Platform / Service Account (Para Google Drive & Sheets)
1. En tu proyecto de Google Cloud Console, genera la clave JSON de tu Service Account.
2. Abre una terminal de PowerShell y conviértela a Base64:
   ```powershell
   [Convert]::ToBase64String([IO.File]::ReadAllBytes("ruta\a\tu\service_account.json"))
   ```
3. Pega esa cadena resultante en `GOOGLE_CHATS_SA_BASE64` (Orbit) y `TEMIS_GOOGLE_SA_BASE64` (Temis).

### D. Keycloak SSO (Para Maxibot)
1. Consulta con el administrador de Identity / Keycloak las credenciales de cliente.
2. En la carpeta `06_Maxibot_Desktop/keycloak-config/` encontrarás las plantillas JSON de referencia de Realm y Users.

---

## 💻 4. Cómo Levantar los Proyectos en Local

Cada proyecto cuenta con un archivo `.bat` automatizado que crea el entorno virtual `.venv`, instala las dependencias de `requirements.txt` y arranca la aplicación con un solo doble clic.

### 🌐 1. Orbit Middleware
* **Launcher:** Doble clic en `01_Orbit_Middleware/Iniciar_Orbit_Local.bat`
* **URL API:** `http://localhost:8000`
* **Documentación Interactiva (Swagger):** `http://localhost:8000/docs`

### 📊 2. Orbit Dashboard
* **Launcher:** Doble clic en `02_Orbit_Dashboard/Iniciar_Dashboard_Local.bat`
* **URL:** `http://localhost:3000`

### 🔌 3. Orbit MCP Server
* **Launcher:** Doble clic en `03_Orbit_MCP_Supabase/Iniciar_MCP_Local.bat`
* **URL:** `http://localhost:8001`
* **Health Check:** `http://localhost:8001/health`

### 🏛️ 4. TEMIS Web Platform
* **Launcher:** Doble clic en `04_Temis_Web_Platform/Iniciar_TEMIS_Local.bat`
* **URL Web:** `http://localhost:3000`
* **Backend API:** `http://localhost:8000`

### 🎙️ 5. TEMIS Media Studio
* **Launcher:** Doble clic en `05_Temis_Media_Studio/Iniciar_Media_Studio.bat`
* Abre la ventana gráfica de escritorio para procesar videos y audios hacia paquetes `.temis.json` y minutas `.docx`.

### 🤖 6. Maxibot Desktop
* **Launcher:** Doble clic en `06_Maxibot_Desktop/Iniciar_Maxibot.bat`
* Inicia la ventana gráfica con autenticación Keycloak y soporte de preguntas operativas.

---

## ☁️ 5. Guía para Subir a GitHub y Desplegar en Render Cloud

### Paso 1: Inicializar tu Repositorio en GitHub
1. Crea una cuenta o inicia sesión en [github.com](https://github.com).
2. Crea un nuevo repositorio (por ejemplo: `Ecosistema-Sistemas`).
3. En la raíz de esta carpeta, abre una terminal y ejecuta:
   ```bash
   git init
   git add .
   git commit -m "feat: initial commit - ecosistema de aplicaciones"
   git branch -M main
   git remote add origin https://github.com/TU_USUARIO/TU_REPOSITORIO.git
   git push -u origin main
   ```

### Paso 2: Despliegue en Render usando Blueprints (`render.yaml`)
1. Inicia sesión en [render.com](https://render.com) (puedes ingresar con tu cuenta de GitHub).
2. En el menú superior, haz clic en **New +** ➔ **Blueprint**.
3. Selecciona tu repositorio de GitHub recién creado.
4. Render leerá automáticamente los archivos `render.yaml` y configurará los servicios web:
   - **En Orbit:** `orbit-api` y `mcp-maxi-estatus`.
   - **En Temis:** `temis-backend` y `temis-web-flow`.
5. En el panel de control de Render de cada servicio, entra a la pestaña **Environment** e introduce las variables de entorno que obtuviste en el Paso 3.
6. ¡Listo! Cada vez que hagas `git push` a la rama `main`, Render compilará y actualizará los servicios en la nube automáticamente.

---

## 📞 6. Documentación Adicional & Soporte

* En `04_Temis_Web_Platform/Backlog_Scrum_area_tecnica_TEMIS.xlsx` encontrarás la planeación técnica, épicas y roadmap del proyecto.
* En `07_Agentes_IA_Prompts/` se detallan las instrucciones de comportamiento y reglas de negocio para cada uno de los agentes conversacionales y verificadores.
