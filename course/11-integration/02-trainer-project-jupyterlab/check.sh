#!/usr/bin/env bash
# Проверка: JupyterLab установлен в проекте m11-project-from-scratch
set -euo pipefail

PROJECT_DIR="${HOME}/m11-project-from-scratch"
errors=0

# Проверка 1: директория проекта существует
if [[ ! -d "$PROJECT_DIR" ]]; then
    echo "❌ FAIL: директория $PROJECT_DIR не найдена"
    echo "Сначала выполните тренажёр 01 (создание проекта с нуля)."
    exit 1
fi
echo "✅ PASS: директория проекта найдена"

# Проверка 2: venv существует
if [[ ! -d "$PROJECT_DIR/venv" ]]; then
    echo "❌ FAIL: venv не найден в $PROJECT_DIR"
    errors=$((errors + 1))
else
    echo "✅ PASS: venv найден"
fi

# Проверка 3: jupyterlab установлен в venv
if [[ -f "$PROJECT_DIR/venv/bin/jupyter" ]]; then
    if "$PROJECT_DIR/venv/bin/pip" show jupyterlab &>/dev/null; then
        echo "✅ PASS: jupyterlab установлен"
    else
        echo "❌ FAIL: jupyterlab не установлен в venv"
        echo "Выполните: source venv/bin/activate && pip install jupyterlab"
        errors=$((errors + 1))
    fi
else
    echo "❌ FAIL: jupyter не найден в venv"
    errors=$((errors + 1))
fi

# Проверка 4: ядро m11-from-scratch всё ещё зарегистрировано
if jupyter kernelspec list 2>/dev/null | grep -q "m11-from-scratch"; then
    echo "✅ PASS: ядро m11-from-scratch зарегистрировано"
else
    echo "❌ FAIL: ядро m11-from-scratch не найдено"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
