#!/usr/bin/env bash
# Проверка: два проекта m11-proj-a и m11-proj-b с разными версиями Python и ядрами
set -euo pipefail

DIR_A="${HOME}/m11-proj-a"
DIR_B="${HOME}/m11-proj-b"
errors=0

# Проект A
if [[ -d "$DIR_A" ]]; then
    if [[ -f "$DIR_A/.python-version" ]]; then
        echo "✅ PASS: m11-proj-a — .python-version существует"
    else
        echo "❌ FAIL: m11-proj-a — .python-version отсутствует"
        errors=$((errors + 1))
    fi
    if [[ -d "$DIR_A/.venv" ]]; then
        echo "✅ PASS: m11-proj-a — venv существует"
    else
        echo "❌ FAIL: m11-proj-a — venv отсутствует"
        errors=$((errors + 1))
    fi
    if (cd "$DIR_A" && source .venv/bin/activate && python -c "import requests" 2>/dev/null); then
        echo "✅ PASS: m11-proj-a — requests установлен"
    else
        echo "❌ FAIL: m11-proj-a — requests не установлен"
        errors=$((errors + 1))
    fi
else
    echo "❌ FAIL: директория m11-proj-a не найдена"
    errors=$((errors + 1))
fi

# Проект B
if [[ -d "$DIR_B" ]]; then
    if [[ -f "$DIR_B/.python-version" ]]; then
        echo "✅ PASS: m11-proj-b — .python-version существует"
    else
        echo "❌ FAIL: m11-proj-b — .python-version отсутствует"
        errors=$((errors + 1))
    fi
    if [[ -d "$DIR_B/.venv" ]]; then
        echo "✅ PASS: m11-proj-b — venv существует"
    else
        echo "❌ FAIL: m11-proj-b — venv отсутствует"
        errors=$((errors + 1))
    fi
    if (cd "$DIR_B" && source .venv/bin/activate && python -c "import rich" 2>/dev/null); then
        echo "✅ PASS: m11-proj-b — rich установлен"
    else
        echo "❌ FAIL: m11-proj-b — rich не установлен"
        errors=$((errors + 1))
    fi
else
    echo "❌ FAIL: директория m11-proj-b не найдена"
    errors=$((errors + 1))
fi

# Оба ядра зарегистрированы
if jupyter kernelspec list 2>/dev/null | grep -q "m11-proj-a"; then
    echo "✅ PASS: ядро m11-proj-a зарегистрировано"
else
    echo "❌ FAIL: ядро m11-proj-a не найдено"
    errors=$((errors + 1))
fi
if jupyter kernelspec list 2>/dev/null | grep -q "m11-proj-b"; then
    echo "✅ PASS: ядро m11-proj-b зарегистрировано"
else
    echo "❌ FAIL: ядро m11-proj-b не найдено"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
