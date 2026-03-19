#!/usr/bin/env bash
# Проверка: JupyterLab установлен в ~/jupyterlab-demo/.venv
set -euo pipefail

DEMO_DIR="${1:-$HOME/jupyterlab-demo}"
VENV_DIR="$DEMO_DIR/.venv"
errors=0

# Проверка 1: директория jupyterlab-demo существует
if [[ ! -d "$DEMO_DIR" ]]; then
    echo "❌ FAIL: директория $DEMO_DIR не найдена"
    echo "Создайте: mkdir -p $DEMO_DIR && cd $DEMO_DIR"
    errors=$((errors + 1))
else
    echo "✅ PASS: директория $DEMO_DIR найдена"
fi

# Проверка 2: venv существует
if [[ ! -d "$VENV_DIR" ]]; then
    echo "❌ FAIL: виртуальное окружение $VENV_DIR не найдено"
    echo "Создайте: python -m venv $VENV_DIR"
    errors=$((errors + 1))
else
    echo "✅ PASS: venv $VENV_DIR найден"
fi

# Проверка 3: jupyterlab установлен в venv
if [[ -f "$VENV_DIR/bin/pip" ]]; then
    if "$VENV_DIR/bin/pip" show jupyterlab &>/dev/null; then
        echo "✅ PASS: jupyterlab установлен в venv"
    else
        echo "❌ FAIL: jupyterlab не установлен в venv"
        echo "Выполните: source $VENV_DIR/bin/activate && pip install jupyterlab"
        errors=$((errors + 1))
    fi
else
    echo "❌ FAIL: pip не найден в venv"
    errors=$((errors + 1))
fi

# Проверка 4: jupyter lab доступен
if [[ -f "$VENV_DIR/bin/jupyter" ]]; then
    if "$VENV_DIR/bin/jupyter" lab --version &>/dev/null; then
        echo "✅ PASS: jupyter lab запускается"
    else
        echo "❌ FAIL: jupyter lab не работает"
        errors=$((errors + 1))
    fi
else
    echo "❌ FAIL: jupyter не найден в venv"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
