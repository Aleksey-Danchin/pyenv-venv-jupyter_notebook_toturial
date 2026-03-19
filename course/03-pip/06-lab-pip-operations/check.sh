#!/usr/bin/env bash
# Проверка: установлены requests и rich, есть requirements.txt
set -euo pipefail

errors=0

# Проверка 1: pip доступен
if ! python -m pip --version &>/dev/null; then
    echo "❌ FAIL: pip не найден. Убедитесь, что Python и pip установлены."
    exit 1
fi

# Проверка 2: requests установлен
if python -m pip list 2>/dev/null | grep -q "^requests "; then
    echo "✅ PASS: пакет requests установлен"
else
    echo "❌ FAIL: пакет requests не установлен"
    echo "  Установите: pip install -r requirements.txt"
    errors=$((errors + 1))
fi

# Проверка 3: rich установлен
if python -m pip list 2>/dev/null | grep -q "^rich "; then
    echo "✅ PASS: пакет rich установлен"
else
    echo "❌ FAIL: пакет rich не установлен"
    echo "  Установите: pip install -r requirements.txt"
    errors=$((errors + 1))
fi

# Проверка 4: requirements.txt существует и содержит нужные пакеты
if [[ -f requirements.txt ]]; then
    if grep -q "requests==" requirements.txt && grep -q "rich==" requirements.txt; then
        echo "✅ PASS: requirements.txt содержит requests и rich с версиями"
    else
        echo "❌ FAIL: requirements.txt не содержит requests и/или rich в формате package==version"
        errors=$((errors + 1))
    fi
else
    echo "❌ FAIL: файл requirements.txt не найден в текущей директории"
    echo "  Создайте: pip freeze > requirements.txt"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
