#!/usr/bin/env bash
# Проверка: зарегистрировано ядро jupyter-kernel-demo через ipykernel
set -euo pipefail

KERNEL_NAME="jupyter-kernel-demo"
KERNELS_DIR="${HOME}/.local/share/jupyter/kernels"

errors=0

# Проверка 1: jupyter kernelspec list выводит ядро jupyter-kernel-demo
if jupyter kernelspec list 2>/dev/null | grep -q "$KERNEL_NAME"; then
    echo "✅ PASS: ядро '$KERNEL_NAME' найдено в списке"
else
    echo "❌ FAIL: ядро '$KERNEL_NAME' не найдено"
    echo "Выполните: python -m ipykernel install --user --name=jupyter-kernel-demo --display-name='Python (jupyter-kernel-demo)'"
    errors=$((errors + 1))
fi

# Проверка 2: директория kernelspec существует
if [[ -d "$KERNELS_DIR/$KERNEL_NAME" ]]; then
    echo "✅ PASS: kernelspec найден в $KERNELS_DIR/$KERNEL_NAME"
else
    echo "❌ FAIL: директория kernelspec не найдена"
    errors=$((errors + 1))
fi

# Проверка 3: в kernelspec есть kernel.json
if [[ -f "$KERNELS_DIR/$KERNEL_NAME/kernel.json" ]]; then
    echo "✅ PASS: kernel.json существует"
else
    echo "❌ FAIL: kernel.json отсутствует"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
