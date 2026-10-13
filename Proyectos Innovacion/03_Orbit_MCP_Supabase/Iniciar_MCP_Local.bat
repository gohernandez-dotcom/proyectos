@echo off
title Orbit MCP Server - Local
cd /d "%~dp0"

echo ==============================================================================
echo  INICIANDO ORBIT MCP SERVER (SUPABASE + GEMINI)
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

echo [*] Iniciando servidor MCP en http://localhost:8001...
uvicorn main:app --reload --host 0.0.0.0 --port 8001

pause
