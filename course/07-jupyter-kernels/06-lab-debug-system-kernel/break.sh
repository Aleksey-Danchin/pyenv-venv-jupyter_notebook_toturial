#!/usr/bin/env bash
# BREAK SCRIPT: создаёт venv с Jupyter и requests, но не регистрирует venv как ядро Jupyter
# Для сопровождающих: Jupyter по умолчанию использует системное ядро Python.
# Студент видит ModuleNotFoundError при import requests в ноутбуке.
# Решение: pip install ipykernel && python -m ipykernel install --user --name kernels-debug-env --display-name "Python (kernels-debug-env)"
# Решение: см. solution.md
set -euo pipefail

TARGET_DIR="${HOME}/kernels-debug-project"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

echo "Подготовка окружения для диагностики..."
echo "Рабочая директория: $TARGET_DIR"
echo ""

# Создаём venv
if [[ -d "kernels-debug-env" ]]; then
    echo "venv kernels-debug-env уже существует."
else
    python3 -m venv kernels-debug-env
    echo "Создан venv: kernels-debug-env"
fi

# Активируем и устанавливаем Jupyter + requests (НО не регистрируем как ядро)
source kernels-debug-env/bin/activate
pip install -q jupyter notebook requests
echo "Установлены: jupyter, notebook, requests"
echo "Ядро НЕ зарегистрировано (это и есть «поломка»)."
deactivate

echo ""
echo "Окружение подготовлено. Прочитайте задание в README.md."
echo "Перейдите в $TARGET_DIR"
echo "Выполните: source kernels-debug-env/bin/activate && jupyter notebook"
echo "Создайте ноутбук и попробуйте: import requests"
