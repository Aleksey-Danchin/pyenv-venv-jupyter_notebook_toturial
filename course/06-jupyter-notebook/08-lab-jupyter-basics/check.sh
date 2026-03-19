#!/usr/bin/env bash
# Проверка: лабораторная Jupyter Notebook — venv, Jupyter, intro.ipynb с Code и Markdown ячейками
set -euo pipefail

LAB_DIR="$HOME/lab-jupyter-basics"
NOTEBOOK="$LAB_DIR/intro.ipynb"
VENV="$LAB_DIR/venv"

errors=0

# Проверка 1: директория существует
if [[ -d "$LAB_DIR" ]]; then
    echo "✅ PASS: директория $LAB_DIR существует"
else
    echo "❌ FAIL: директория $LAB_DIR не найдена"
    errors=$((errors + 1))
fi

# Проверка 2: venv существует
if [[ -d "$VENV" ]] && [[ -f "$VENV/bin/python" ]]; then
    echo "✅ PASS: виртуальное окружение venv существует"
else
    echo "❌ FAIL: виртуальное окружение venv не найдена или неполная"
    errors=$((errors + 1))
fi

# Проверка 3: intro.ipynb существует
if [[ -f "$NOTEBOOK" ]]; then
    echo "✅ PASS: файл intro.ipynb существует"
else
    echo "❌ FAIL: файл intro.ipynb не найден"
    errors=$((errors + 1))
fi

# Проверка 4: в ноутбуке есть ячейки Code и Markdown
if [[ -f "$NOTEBOOK" ]]; then
    if python3 -c "
import json
with open('$NOTEBOOK') as f:
    nb = json.load(f)
cells = nb.get('cells', [])
types = [c['cell_type'] for c in cells]
if 'code' not in types:
    print('NO_CODE')
    exit(1)
if 'markdown' not in types:
    print('NO_MARKDOWN')
    exit(1)
code_cells = [c for c in cells if c['cell_type'] == 'code']
has_print = any('print' in ''.join(c.get('source', [])) for c in code_cells)
if not has_print:
    print('NO_PRINT')
    exit(1)
" 2>/dev/null; then
        echo "✅ PASS: ноутбук содержит ячейки Code (с print) и Markdown"
    else
        echo "❌ FAIL: в ноутбуке должны быть ячейка Code с print и ячейка Markdown"
        errors=$((errors + 1))
    fi
fi

# Проверка 5: Jupyter установлен в venv
if [[ -f "$VENV/bin/jupyter" ]]; then
    echo "✅ PASS: Jupyter установлен в venv"
else
    echo "❌ FAIL: Jupyter не найден в venv"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors. Сверьтесь с solution.md."
    exit 1
fi

echo ""
echo "Все проверки пройдены."
