#!/usr/bin/env bash
# Проверка: финальная лабораторная — полный цикл проекта m11-final
set -euo pipefail

PROJECT_DIR="${HOME}/m11-final-project"
KERNEL_NAME="m11-final"

errors=0

if [[ ! -d "$PROJECT_DIR" ]]; then
    echo "❌ FAIL: проект $PROJECT_DIR не найден"
    exit 1
fi

cd "$PROJECT_DIR"

# .python-version
if [[ ! -f ".python-version" ]]; then
    echo "❌ FAIL: .python-version отсутствует"
    errors=$((errors + 1))
else
    echo "✅ PASS: .python-version присутствует"
fi

# requirements.txt
if [[ ! -f "requirements.txt" ]]; then
    echo "❌ FAIL: requirements.txt отсутствует"
    errors=$((errors + 1))
else
    echo "✅ PASS: requirements.txt присутствует"
fi

# .gitignore
if [[ ! -f ".gitignore" ]]; then
    echo "❌ FAIL: .gitignore отсутствует"
    errors=$((errors + 1))
else
    echo "✅ PASS: .gitignore присутствует"
fi

# venv
if [[ ! -d "venv" ]]; then
    echo "❌ FAIL: venv не найден"
    errors=$((errors + 1))
else
    echo "✅ PASS: venv присутствует"
fi

# kernel
if ! jupyter kernelspec list 2>/dev/null | grep -q "$KERNEL_NAME"; then
    echo "❌ FAIL: ядро '$KERNEL_NAME' не зарегистрировано"
    errors=$((errors + 1))
else
    echo "✅ PASS: ядро '$KERNEL_NAME' зарегистрировано"
fi

# requests установлен в venv
source venv/bin/activate
if ! python -c "import requests" 2>/dev/null; then
    echo "❌ FAIL: requests не установлен в venv"
    errors=$((errors + 1))
else
    echo "✅ PASS: requests установлен в venv"
fi
deactivate

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
