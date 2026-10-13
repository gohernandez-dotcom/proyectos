@echo off
title TEMIS Web Platform - Reflex Local
cd /d "%~dp0"

echo ==============================================================================
echo  INICIANDO TEMIS WEB PLATFORM (REFLEX + FASTAPI)
echo ==============================================================================

if not exist ".venv" (
    echo [*] Creando entorno virtual Python (.venv)...
    python -m venv .venv
)

echo [*] Activando entorno virtual...
call .venv\Scripts\activate.bat

echo [*] Verificando e instalando dependencias...
pip install -r requirements.txt

if not exist ".env" (
    if exist ".env.example" (
        echo [!] Creando archivo .env a partir de .env.example...
        copy .env.example .env
    )
)

echo [*] Iniciando aplicacion TEMIS en http://localhost:3000...
python -m reflex run

pause
