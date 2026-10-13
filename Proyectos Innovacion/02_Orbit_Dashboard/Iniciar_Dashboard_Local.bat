@echo off
title Orbit Dashboard - Reflex Local
cd /d "%~dp0"

echo ==============================================================================
echo  INICIANDO ORBIT DASHBOARD (REFLEX)
echo ==============================================================================

if not exist ".venv" (
    echo [*] Creando entorno virtual Python (.venv)...
    python -m venv .venv
)

echo [*] Activando entorno virtual...
call .venv\Scripts\activate.bat

echo [*] Verificando e instalando dependencias...
pip install -r requirements.txt

echo [*] Iniciando aplicacion Reflex en http://localhost:3000...
python -m reflex run

pause
