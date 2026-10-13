@echo off
title Orbit Middleware - Local Server
cd /d "%~dp0"

echo ==============================================================================
echo  INICIANDO ORBIT MIDDLEWARE (FASTAPI)
echo ==============================================================================

if not exist ".venv" (
    echo [*] Creando entorno virtual Python (.venv)...
    python -m venv .venv
)

echo [*] Activando entorno virtual...
call .venv\Scripts\activate.bat

echo [*] Verificando e instalando dependencias...
pip install -r api\requirements.txt

if not exist ".env" (
    if exist ".env.example" (
        echo [!] Creando archivo .env a partir de .env.example...
        copy .env.example .env
        echo [!] RECUERDA configurar tus credenciales en el archivo .env
    )
)

echo [*] Iniciando servidor FastAPI en http://localhost:8000
echo [*] Documentacion Swagger interactiva disponible en: http://localhost:8000/docs
set PYTHONPATH=.
uvicorn api.main:app --reload --host 0.0.0.0 --port 8000

pause
