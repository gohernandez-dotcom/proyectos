@echo off
title Maxibot Desktop App
cd /d "%~dp0"

echo ==============================================================================
echo  INICIANDO MAXIBOT DESKTOP
echo ==============================================================================

if not exist ".venv" (
    echo [*] Creando entorno virtual Python (.venv)...
    python -m venv .venv
)

echo [*] Activando entorno virtual...
call .venv\Scripts\activate.bat

echo [*] Verificando dependencias...
pip install -r requirements.txt

if not exist ".env" (
    if exist ".env.example" (
        echo [!] Creando archivo .env a partir de .env.example...
        copy .env.example .env
    )
)

echo [*] Iniciando interfaz de MaxiBot...
python MaxiBot_V4.6.2_DevOpsMCP.py

pause
