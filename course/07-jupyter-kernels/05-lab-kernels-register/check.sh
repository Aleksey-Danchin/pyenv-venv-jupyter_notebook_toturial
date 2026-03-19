#!/usr/bin/env bash
# Проверка: зарегистрировано ядро Jupyter для venv kernels-lab
# Запускать из ~/kernels-lab или передать путь к venv как первый аргумент
set -euo pipefail

LAB_DIR="${1:-$HOME/kernels-lab}"
VENV="$LAB_DIR/venv"

if [[ ! -d "$VENV" ]]; then
    echo "❌ FAIL: venv не найден: $VENV"
    echo "Создайте venv: python3 -m venv $VENV"
    exit 1
fi

if [[ ! -f "$VENV/bin/python" ]]; then
    echo "❌ FAIL: python не найден в venv: $VENV/bin/python"
    exit 1
fi

# Проверка: ipykernel установлен в venv
if "$VENV/bin/python" -c "import ipykernel" 2>/dev/null; then
    echo "✅ PASS: ipykernel установлен в venv"
else
    echo "❌ FAIL: ipykernel не установлен в venv"
    echo "Выполните: source $VENV/bin/activate && pip install ipykernel"
    exit 1
fi

# Проверка: ядро kernels-lab зарегистрировано
if jupyter kernelspec list 2>/dev/null | grep -q "kernels-lab"; then
    echo "✅ PASS: ядро kernels-lab зарегистрировано"
else
    echo "❌ FAIL: ядро kernels-lab не найдено в jupyter kernelspec list"
    echo "Выполните: source $VENV/bin/activate && python -m ipykernel install --user --name kernels-lab --display-name \"Python (kernels-lab)\""
    exit 1
fi

echo ""
echo "Все проверки пройдены."
