#!/usr/bin/env bash
# BREAK SCRIPT: удаляет libssl-dev, чтобы pyenv install не мог скомпилировать модуль ssl
# Для сопровождающих: этот скрипт создаёт ситуацию, где pyenv install падает из-за
# отсутствия заголовочных файлов OpenSSL. Решение: sudo apt install -y libssl-dev
# Решение: см. solution.md
set -euo pipefail

echo "Подготовка окружения для диагностики..."
echo ""

if dpkg -l libssl-dev &>/dev/null 2>&1 && dpkg -l libssl-dev | grep -q "^ii"; then
    echo "Удаляю пакет libssl-dev (потребуется пароль sudo)..."
    sudo apt remove -y libssl-dev > /dev/null 2>&1
    echo "Пакет libssl-dev удалён."
else
    echo "Пакет libssl-dev уже отсутствует."
fi

# Удалим кешированную версию, если она есть, чтобы pyenv пытался скомпилировать заново
target_version="3.11.7"
if [[ -d "$HOME/.pyenv/versions/$target_version" ]]; then
    echo "Удаляю ранее установленную версию Python $target_version..."
    rm -rf "$HOME/.pyenv/versions/$target_version"
    echo "Версия $target_version удалена."
fi

echo ""
echo "Окружение подготовлено. Прочитайте задание в README.md."
echo "Попробуйте выполнить: pyenv install $target_version"
