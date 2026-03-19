#!/usr/bin/env bash
# Проверка: лабораторная — экспорт и воспроизведение ноутбука
set -euo pipefail

LAB_DIR="$HOME/lab-jupyter-export"
VENV="$LAB_DIR/venv"
NOTEBOOK="$LAB_DIR/report.ipynb"
HTML="$LAB_DIR/report.html"
PY="$LAB_DIR/report.py"
REQ="$LAB_DIR/requirements.txt"

errors=0

# Проверка 1: директория существует
if [[ -d "$LAB_DIR" ]]; then
    echo "✅ PASS: директория $LAB_DIR существует"
else
    echo "❌ FAIL: директория $LAB_DIR не найдена"
    errors=$((errors + 1))
fi

# Проверка 2: report.ipynb
if [[ -f "$NOTEBOOK" ]]; then
    echo "✅ PASS: report.ipynb существует"
else
    echo "❌ FAIL: report.ipynb не найден"
    errors=$((errors + 1))
fi

# Проверка 3: report.html
if [[ -f "$HTML" ]]; then
    echo "✅ PASS: report.html (экспорт) существует"
else
    echo "❌ FAIL: report.html не найден — выполните jupyter nbconvert --to html report.ipynb"
    errors=$((errors + 1))
fi

# Проверка 4: report.py
if [[ -f "$PY" ]]; then
    echo "✅ PASS: report.py (экспорт) существует"
else
    echo "❌ FAIL: report.py не найден — выполните jupyter nbconvert --to script report.ipynb"
    errors=$((errors + 1))
fi

# Проверка 5: requirements.txt
if [[ -f "$REQ" ]]; then
    echo "✅ PASS: requirements.txt существует"
else
    echo "❌ FAIL: requirements.txt не найден — выполните pip freeze > requirements.txt"
    errors=$((errors + 1))
fi

# Проверка 6: venv с Jupyter
if [[ -d "$VENV" ]] && [[ -f "$VENV/bin/jupyter" ]]; then
    echo "✅ PASS: venv с Jupyter существует"
else
    echo "❌ FAIL: venv неполная или Jupyter не установлен в venv"
    errors=$((errors + 1))
fi

# Проверка 7: ноутбук содержит Code и Markdown
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
has_import = any('matplotlib' in ''.join(c.get('source', [])) or 'import' in ''.join(c.get('source', [])) for c in code_cells)
if not has_import:
    print('NO_IMPORT')
    exit(1)
" 2>/dev/null; then
        echo "✅ PASS: ноутбук содержит Code и Markdown, есть import"
    else
        echo "❌ FAIL: в ноутбуке должны быть ячейки Code (с import/matplotlib) и Markdown"
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
