#!/usr/bin/env bash
# BREAK SCRIPT: создаёт проект, где .python-version указывает 3.11.7, а venv построен на 3.12
# Для сопровождающих: имитация ситуации, когда venv создавали с другой активной версией Python.
# Студент видит рассинхрон версий.
# Решение: см. solution.md
set -euo pipefail

TARGET_DIR="${HOME}/m11-debug-conflict"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

echo "Подготовка окружения для диагностики..."
echo "Рабочая директория: $TARGET_DIR"
echo ""

# Проверка: требуются 3.11.7 и 3.12.5 (из модулей 1-2)
for v in 3.11.7 3.12.5; do
    if ! pyenv versions --bare 2>/dev/null | grep -qE "^${v}$"; then
        echo "Требуется Python ${v}. Выполните: pyenv install ${v}"
        exit 1
    fi
done

# Создаём venv с Python 3.12 (временно переключаем)
pyenv local 3.12.5
python -m venv venv
source venv/bin/activate
pip install -q ipykernel
python -m ipykernel install --user --name m11-debug-conflict --display-name "Python (m11-debug-conflict)"
deactivate

# Теперь «ломаем»: ставим .python-version на 3.11.7, но venv остаётся на 3.12
echo "3.11.7" > .python-version

echo ""
echo "Окружение подготовлено. Прочитайте задание в README.md."
echo "Перейдите в $TARGET_DIR и найдите причину рассинхрона версий."
