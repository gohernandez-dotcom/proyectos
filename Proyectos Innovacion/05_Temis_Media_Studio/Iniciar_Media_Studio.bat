@echo off
title TEMIS Media Studio - Desktop App
cd /d "%~dp0"

echo ==============================================================================
echo  INICIANDO TEMIS MEDIA STUDIO (DESKTOP)
echo ==============================================================================

if not exist ".venv" (
    echo [*] Creando entorno virtual Python (.venv)...
    python -m venv .venv
)

echo [*] Activando entorno virtual...
call .venv\Scripts\activate.bat

echo [*] Verificando dependencias...
pip install -r requirements.txt

echo [*] Iniciando interfaz de TEMIS Media Studio...
python main.py

pause
