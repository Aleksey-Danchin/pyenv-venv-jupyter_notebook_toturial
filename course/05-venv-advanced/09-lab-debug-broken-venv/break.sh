#!/usr/bin/env bash
# BREAK SCRIPT: создаёт venv от версии Python, затем удаляет эту версию через pyenv uninstall
# Для сопровождающих: venv остаётся «сломанным» — указывает на несуществующий интерпретатор.
# Решение: pyenv install <version> снова, тогда venv заработает.
# См. solution.md
set -euo pipefail

TARGET_VERSION="3.11.7"
PROJECT_DIR="$HOME/course-debug-broken-venv"

echo "Подготовка окружения для диагностики..."
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# Удалить предыдущее состояние
rm -rf venv .python-version

# Установить версию Python, если её нет
if [[ ! -d "$HOME/.pyenv/versions/$TARGET_VERSION" ]]; then
    echo "Устанавливаю Python $TARGET_VERSION..."
    pyenv install -s "$TARGET_VERSION" || {
        echo "Ошибка: не удалось установить $TARGET_VERSION. Проверьте pyenv и зависимости сборки."
        exit 1
    }
fi

# Привязать версию к проекту
echo "$TARGET_VERSION" > .python-version

# Создать venv
echo "Создаю виртуальное окружение..."
python -m venv venv

# Удалить версию Python — venv станет «сломанным»
echo "Удаляю версию Python $TARGET_VERSION..."
pyenv uninstall -f "$TARGET_VERSION"

echo ""
echo "Окружение подготовлено. Прочитайте задание в README.md."
echo "Перейдите: cd $PROJECT_DIR && source venv/bin/activate"
echo "Ожидается ошибка при активации или запуске python."
