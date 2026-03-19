#!/usr/bin/env bash
# BREAK SCRIPT: подменяет venv/bin/pip симлинком на системный pip
# Для сопровождающих: в результате pip в «активном» venv устанавливает пакеты в системный Python.
# Решение: удалить симлинк и выполнить python -m ensurepip --upgrade, или пересоздать venv.
# См. solution.md
set -euo pipefail

PROJECT_DIR="$HOME/course-debug-pip-system"

echo "Подготовка окружения для диагностики..."
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# Удалить предыдущее состояние, если есть
rm -rf venv

# Создать venv
echo "Создаю виртуальное окружение..."
python3 -m venv venv

# Подменить pip симлинком на системный (предпочтительно /usr/bin/pip3)
for cand in /usr/bin/pip3 /usr/bin/pip; do
    if [[ -e "$cand" ]]; then
        SYSTEM_PIP="$cand"
        break
    fi
done
if [[ -z "${SYSTEM_PIP:-}" ]]; then
    echo "Ошибка: системный pip не найден. Установите python3-pip: sudo apt install python3-pip"
    exit 1
fi

echo "Создаю симлинк venv/bin/pip -> $SYSTEM_PIP"
rm -f venv/bin/pip
ln -sf "$SYSTEM_PIP" venv/bin/pip

echo ""
echo "Окружение подготовлено. Прочитайте задание в README.md."
echo "Перейдите: cd $PROJECT_DIR && source venv/bin/activate"
