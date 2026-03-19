#!/usr/bin/env bash
# Проверка: проект m11-debug-conflict имеет согласованную версию (3.11.7)
set -euo pipefail

PROJECT_DIR="${HOME}/m11-debug-conflict"
KERNEL_NAME="m11-debug-conflict"
EXPECTED_VERSION="3.11.7"

errors=0

if [[ ! -d "$PROJECT_DIR" ]]; then
    echo "❌ FAIL: директория $PROJECT_DIR не найдена"
    exit 1
fi

cd "$PROJECT_DIR"

# .python-version = 3.11.7
if grep -q "$EXPECTED_VERSION" .python-version 2>/dev/null; then
    echo "✅ PASS: .python-version содержит $EXPECTED_VERSION"
else
    echo "❌ FAIL: .python-version не содержит $EXPECTED_VERSION"
    errors=$((errors + 1))
fi

# venv существует
if [[ -d "venv" ]] && [[ -f "venv/bin/python" ]]; then
    echo "✅ PASS: venv существует"
else
    echo "❌ FAIL: venv отсутствует или неполный"
    errors=$((errors + 1))
fi

# python в venv = 3.11.7
VENV_PYTHON_VER=$(venv/bin/python --version 2>&1 || echo "")
if [[ "$VENV_PYTHON_VER" == *"3.11"* ]]; then
    echo "✅ PASS: venv использует Python 3.11.x"
else
    echo "❌ FAIL: venv использует другую версию: $VENV_PYTHON_VER"
    errors=$((errors + 1))
fi

# Ядро зарегистрировано
if jupyter kernelspec list 2>/dev/null | grep -q "$KERNEL_NAME"; then
    echo "✅ PASS: ядро '$KERNEL_NAME' зарегистрировано"
else
    echo "❌ FAIL: ядро '$KERNEL_NAME' не найдено"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
