#!/usr/bin/env bash
# Проверка: Jupyter установлен в venv и доступен
set -euo pipefail

errors=0

# Проверка 1: venv активирован (VIRTUAL_ENV задана)
if [[ -z "${VIRTUAL_ENV:-}" ]]; then
    echo "❌ FAIL: venv не активирован. Выполните: source venv/bin/activate"
    errors=$((errors + 1))
else
    echo "✅ PASS: venv активирован — $VIRTUAL_ENV"
fi

# Проверка 2: jupyter доступен
if command -v jupyter &>/dev/null; then
    echo "✅ PASS: jupyter найден — $(command -v jupyter)"
else
    echo "❌ FAIL: команда jupyter не найдена. Установите: pip install jupyter notebook"
    errors=$((errors + 1))
fi

# Проверка 3: jupyter указывает на venv
if command -v jupyter &>/dev/null; then
    jupyter_path=$(command -v jupyter)
    if [[ "$jupyter_path" == *"/venv/"* ]] || [[ "$jupyter_path" == *"${VIRTUAL_ENV:-}/"* ]]; then
        echo "✅ PASS: jupyter из venv — $jupyter_path"
    else
        echo "❌ FAIL: jupyter не из venv: $jupyter_path. Активируйте venv."
        errors=$((errors + 1))
    fi
fi

# Проверка 4: jupyter --version выполняется
if jupyter --version &>/dev/null; then
    echo "✅ PASS: jupyter --version — $(jupyter --version 2>&1 | head -1)"
else
    echo "❌ FAIL: jupyter --version завершилась с ошибкой"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors."
    exit 1
fi

echo ""
echo "Все проверки пройдены."
