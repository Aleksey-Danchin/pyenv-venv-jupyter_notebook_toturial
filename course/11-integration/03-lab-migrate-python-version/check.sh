#!/usr/bin/env bash
# Проверка: проект m11-project-from-scratch мигрирован на новую версию Python
set -euo pipefail

PROJECT_DIR="${HOME}/m11-project-from-scratch"
KERNEL_NAME="m11-from-scratch"
errors=0

if [[ ! -d "$PROJECT_DIR" ]]; then
    echo "❌ FAIL: директория $PROJECT_DIR не найдена"
    echo "Используйте проект из тренажёра 01 или создайте аналогичный"
    exit 1
fi

cd "$PROJECT_DIR"

# .python-version существует
if [[ ! -f ".python-version" ]]; then
    echo "❌ FAIL: файл .python-version отсутствует"
    errors=$((errors + 1))
else
    echo "✅ PASS: .python-version существует"
fi

# venv существует
if [[ ! -d "venv" ]]; then
    echo "❌ FAIL: директория venv отсутствует"
    errors=$((errors + 1))
else
    echo "✅ PASS: venv существует"
fi

# Версия Python в venv совпадает с .python-version
PYVER=$(cat .python-version 2>/dev/null || echo "")
if [[ -n "$PYVER" ]] && [[ -f "venv/bin/python" ]]; then
    VENV_VER=$(venv/bin/python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')" 2>/dev/null || echo "")
    if [[ "$PYVER" == *"$VENV_VER"* ]] || [[ "$VENV_VER" == *"${PYVER%.*}"* ]]; then
        echo "✅ PASS: версия Python в venv соответствует .python-version"
    else
        echo "⚠️  CHECK: убедитесь, что venv создан на базе версии из .python-version"
    fi
fi

# Ядро зарегистрировано
if jupyter kernelspec list 2>/dev/null | grep -q "$KERNEL_NAME"; then
    echo "✅ PASS: ядро '$KERNEL_NAME' зарегистрировано"
else
    echo "❌ FAIL: ядро '$KERNEL_NAME' не найдено"
    errors=$((errors + 1))
fi

# jupyter установлен в venv
if [[ -f "venv/bin/jupyter" ]]; then
    echo "✅ PASS: Jupyter установлен в venv"
else
    echo "❌ FAIL: Jupyter не найден в venv"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
