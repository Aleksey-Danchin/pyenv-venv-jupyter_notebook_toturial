#!/usr/bin/env bash
# Проверка: проект m11-project-from-scratch создан по цепочке pyenv → venv → pip → jupyter → kernel
# Требования: директория ~/m11-project-from-scratch, .python-version, venv .venv, ядро m11-from-scratch
set -euo pipefail

PROJECT_DIR="${HOME}/m11-project-from-scratch"
VENV_DIR="${PROJECT_DIR}/.venv"
KERNEL_NAME="m11-from-scratch"
KERNELS_DIR="${HOME}/.local/share/jupyter/kernels"

errors=0

# Проверка 1: директория проекта существует
if [[ -d "$PROJECT_DIR" ]]; then
    echo "✅ PASS: директория проекта $PROJECT_DIR найдена"
else
    echo "❌ FAIL: директория $PROJECT_DIR не найдена"
    echo "Создайте проект: mkdir -p ~/m11-project-from-scratch && cd ~/m11-project-from-scratch"
    errors=$((errors + 1))
fi

# Проверка 2: .python-version существует
if [[ -f "$PROJECT_DIR/.python-version" ]]; then
    echo "✅ PASS: .python-version найден"
else
    echo "❌ FAIL: .python-version не найден"
    echo "Выполните: cd $PROJECT_DIR && pyenv local <версия>"
    errors=$((errors + 1))
fi

# Проверка 3: venv существует
if [[ -d "$VENV_DIR" ]] && [[ -f "$VENV_DIR/bin/activate" ]]; then
    echo "✅ PASS: venv .venv найден"
else
    echo "❌ FAIL: venv .venv не найден"
    echo "Выполните: cd $PROJECT_DIR && python -m venv .venv"
    errors=$((errors + 1))
fi

# Проверка 4: jupyter установлен в venv
if [[ -f "$VENV_DIR/bin/jupyter" ]]; then
    echo "✅ PASS: jupyter установлен в venv"
else
    echo "❌ FAIL: jupyter не найден в venv"
    echo "Выполните: source $VENV_DIR/bin/activate && pip install jupyter notebook ipykernel"
    errors=$((errors + 1))
fi

# Проверка 5: ядро m11-from-scratch зарегистрировано
if jupyter kernelspec list 2>/dev/null | grep -q "$KERNEL_NAME"; then
    echo "✅ PASS: ядро '$KERNEL_NAME' зарегистрировано"
else
    echo "❌ FAIL: ядро '$KERNEL_NAME' не найдено"
    echo "Выполните: source $VENV_DIR/bin/activate && python -m ipykernel install --user --name=m11-from-scratch --display-name='Python (m11-from-scratch)'"
    errors=$((errors + 1))
fi

# Проверка 6: kernelspec существует
if [[ -d "$KERNELS_DIR/$KERNEL_NAME" ]]; then
    echo "✅ PASS: kernelspec найден"
else
    echo "❌ FAIL: директория kernelspec не найдена"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
