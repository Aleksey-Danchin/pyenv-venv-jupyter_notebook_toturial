#!/usr/bin/env bash
# Проверка: итоговая лабораторная Jupyter — venv, ядро, ноутбук с данными, viz, magic, экспорт
set -euo pipefail

LAB_DIR="$HOME/lab-jupyter-final"
VENV="$LAB_DIR/venv"
NOTEBOOK="$LAB_DIR/final.ipynb"
HTML="$LAB_DIR/final.html"
REQ="$LAB_DIR/requirements.txt"

errors=0

# Проверка 1: директория
if [[ -d "$LAB_DIR" ]]; then
    echo "✅ PASS: директория $LAB_DIR существует"
else
    echo "❌ FAIL: директория $LAB_DIR не найдена"
    errors=$((errors + 1))
fi

# Проверка 2: venv
if [[ -d "$VENV" ]] && [[ -f "$VENV/bin/python" ]]; then
    echo "✅ PASS: venv существует"
else
    echo "❌ FAIL: venv не найдена"
    errors=$((errors + 1))
fi

# Проверка 3: Jupyter в venv
if [[ -f "$VENV/bin/jupyter" ]]; then
    echo "✅ PASS: Jupyter установлен в venv"
else
    echo "❌ FAIL: Jupyter не найден в venv"
    errors=$((errors + 1))
fi

# Проверка 4: ядро lab-jupyter-final
if jupyter kernelspec list 2>/dev/null | grep -qi lab-jupyter-final; then
    echo "✅ PASS: ядро lab-jupyter-final зарегистрировано"
else
    echo "❌ FAIL: ядро lab-jupyter-final не найдено — зарегистрируйте venv через ipykernel"
    errors=$((errors + 1))
fi

# Проверка 5: final.ipynb
if [[ -f "$NOTEBOOK" ]]; then
    echo "✅ PASS: final.ipynb существует"
else
    echo "❌ FAIL: final.ipynb не найден"
    errors=$((errors + 1))
fi

# Проверка 6: final.html
if [[ -f "$HTML" ]]; then
    echo "✅ PASS: final.html (экспорт) существует"
else
    echo "❌ FAIL: final.html не найден"
    errors=$((errors + 1))
fi

# Проверка 7: requirements.txt
if [[ -f "$REQ" ]]; then
    echo "✅ PASS: requirements.txt существует"
else
    echo "❌ FAIL: requirements.txt не найден"
    errors=$((errors + 1))
fi

# Проверка 8: содержимое ноутбука — Code, Markdown, matplotlib, magic
if [[ -f "$NOTEBOOK" ]]; then
    if python3 -c "
import json
with open('$NOTEBOOK') as f:
    nb = json.load(f)
cells = nb.get('cells', [])
types = [c['cell_type'] for c in cells]
if 'code' not in types or 'markdown' not in types:
    print('NO_TYPES')
    exit(1)
all_src = ''.join(''.join(c.get('source', [])) for c in cells)
if 'matplotlib' not in all_src and 'plt' not in all_src:
    print('NO_MATPLOTLIB')
    exit(1)
if '%' not in all_src and '!' not in all_src:
    print('NO_MAGIC')
    exit(1)
" 2>/dev/null; then
        echo "✅ PASS: ноутбук содержит Code, Markdown, matplotlib и магическую команду"
    else
        echo "❌ FAIL: в ноутбуке нужны Code, Markdown, matplotlib и магическая команда (% или !)"
        errors=$((errors + 1))
    fi
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors. Сверьтесь с solution.md."
    exit 1
fi

echo ""
echo "Все проверки пройдены."
