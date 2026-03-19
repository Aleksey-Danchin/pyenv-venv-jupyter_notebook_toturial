#!/usr/bin/env bash
# Проверка: проект m11-removal-demo полностью удалён (ядро и venv)
set -euo pipefail

PROJECT_DIR="${HOME}/m11-removal-demo"
KERNEL_NAME="m11-removal-demo"

errors=0

# Проверка 1: ядро удалено
if jupyter kernelspec list 2>/dev/null | grep -q "$KERNEL_NAME"; then
    echo "❌ FAIL: ядро '$KERNEL_NAME' всё ещё в списке. Выполните: jupyter kernelspec remove $KERNEL_NAME"
    errors=$((errors + 1))
else
    echo "✅ PASS: ядро '$KERNEL_NAME' удалено"
fi

# Проверка 2: venv удалён
if [[ -d "$PROJECT_DIR/venv" ]]; then
    echo "❌ FAIL: директория venv существует в $PROJECT_DIR"
    errors=$((errors + 1))
else
    echo "✅ PASS: venv удалён"
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
