#!/usr/bin/env bash
# Проверка: venv + pyenv, requirements, множественные окружения
# Ожидается: ~/lab-venv-advanced с venv, venv-alt, requirements.txt, .python-version
set -euo pipefail

LAB_DIR="$HOME/lab-venv-advanced"

if [[ ! -d "$LAB_DIR" ]]; then
    echo "❌ FAIL: Директория $LAB_DIR не найдена"
    exit 1
fi

if [[ ! -f "$LAB_DIR/.python-version" ]]; then
    echo "❌ FAIL: Файл .python-version отсутствует"
    exit 1
fi

if [[ ! -f "$LAB_DIR/requirements.txt" ]]; then
    echo "❌ FAIL: Файл requirements.txt отсутствует"
    exit 1
fi

if [[ ! -d "$LAB_DIR/venv" ]] || [[ ! -f "$LAB_DIR/venv/bin/activate" ]]; then
    echo "❌ FAIL: Окружение venv не создано или неполное"
    exit 1
fi

if [[ ! -d "$LAB_DIR/venv-alt" ]] || [[ ! -f "$LAB_DIR/venv-alt/bin/activate" ]]; then
    echo "❌ FAIL: Окружение venv-alt не создано или неполное"
    exit 1
fi

# Проверка пакетов в venv
VENV_PYTHON="$LAB_DIR/venv/bin/python"
if ! "$VENV_PYTHON" -c "import requests" 2>/dev/null; then
    echo "❌ FAIL: Пакет requests не установлен в venv"
    exit 1
fi
if ! "$VENV_PYTHON" -c "import rich" 2>/dev/null; then
    echo "❌ FAIL: Пакет rich не установлен в venv"
    exit 1
fi

# Проверка пакетов в venv-alt
VENV_ALT_PYTHON="$LAB_DIR/venv-alt/bin/python"
if ! "$VENV_ALT_PYTHON" -c "import requests" 2>/dev/null; then
    echo "❌ FAIL: Пакет requests не установлен в venv-alt"
    exit 1
fi
if ! "$VENV_ALT_PYTHON" -c "import rich" 2>/dev/null; then
    echo "❌ FAIL: Пакет rich не установлен в venv-alt"
    exit 1
fi

echo "✅ PASS: Лабораторная выполнена корректно"
