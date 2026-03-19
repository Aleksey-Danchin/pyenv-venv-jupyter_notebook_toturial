#!/usr/bin/env bash
# Проверка: JupyterLab установлен в venv, лабораторная по миграции выполнена
# Аргумент 1 (опционально): путь к директории проекта или к venv
#   По умолчанию ~/jupyterlab-demo (как в тренажёре 02)
#   Ищет venv в: .venv или venv
set -euo pipefail

LAB_DIR="${1:-$HOME/jupyterlab-demo}"
# Если передан путь напрямую к venv (есть bin/activate)
if [[ -n "${1:-}" ]] && [[ -f "${1}/bin/activate" ]]; then
    VENV_DIR="$1"
elif [[ -d "$LAB_DIR/.venv" ]]; then
    VENV_DIR="$LAB_DIR/.venv"
elif [[ -d "$LAB_DIR/venv" ]]; then
    VENV_DIR="$LAB_DIR/venv"
else
    VENV_DIR="$LAB_DIR/.venv"
fi

errors=0

# Проверка 1: venv существует
if [[ ! -d "$VENV_DIR" ]]; then
    echo "❌ FAIL: venv не найден: $VENV_DIR"
    echo "Создайте venv с JupyterLab: python -m venv .venv && source .venv/bin/activate && pip install jupyterlab"
    errors=$((errors + 1))
else
    echo "✅ PASS: venv найден"
fi

# Проверка 2: jupyterlab установлен
if [[ -f "$VENV_DIR/bin/pip" ]]; then
    if "$VENV_DIR/bin/pip" show jupyterlab &>/dev/null; then
        echo "✅ PASS: jupyterlab установлен"
    else
        echo "❌ FAIL: jupyterlab не установлен в venv"
        echo "Выполните: pip install jupyterlab"
        errors=$((errors + 1))
    fi
else
    echo "❌ FAIL: pip не найден в venv"
    errors=$((errors + 1))
fi

# Проверка 3: jupyter lab работает
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
echo "Все проверки пройдены. Убедитесь, что вы открыли ноутбук в JupyterLab и проверили sys.executable."
