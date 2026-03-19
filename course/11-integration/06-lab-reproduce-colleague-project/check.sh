#!/usr/bin/env bash
# Проверка: воспроизведён проект m11-colleague-reproduce по requirements + .python-version
set -euo pipefail

PROJECT_DIR="${HOME}/m11-colleague-reproduce"
KERNEL_NAME="m11-colleague-env"
errors=0

if [[ ! -d "$PROJECT_DIR" ]]; then
    echo "❌ FAIL: директория $PROJECT_DIR не найдена"
    exit 1
fi

cd "$PROJECT_DIR"

if [[ ! -f ".python-version" ]]; then
    echo "❌ FAIL: .python-version отсутствует"
    errors=$((errors + 1))
else
    echo "✅ PASS: .python-version найден"
fi

if [[ ! -f "requirements.txt" ]]; then
    echo "❌ FAIL: requirements.txt отсутствует"
    errors=$((errors + 1))
else
    echo "✅ PASS: requirements.txt найден"
fi

if [[ ! -d "venv" ]]; then
    echo "❌ FAIL: venv отсутствует"
    errors=$((errors + 1))
else
    echo "✅ PASS: venv найден"
fi

if [[ -d "venv" ]]; then
    if source venv/bin/activate 2>/dev/null; then
        if python -c "import requests; import jupyter" 2>/dev/null; then
            echo "✅ PASS: requests и jupyter установлены в venv"
        else
            echo "❌ FAIL: requests или jupyter не установлены в venv"
            errors=$((errors + 1))
        fi
        deactivate 2>/dev/null || true
    fi
fi

if jupyter kernelspec list 2>/dev/null | grep -q "$KERNEL_NAME"; then
    echo "✅ PASS: ядро $KERNEL_NAME зарегистрировано"
else
    echo "❌ FAIL: ядро $KERNEL_NAME не найдено"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
