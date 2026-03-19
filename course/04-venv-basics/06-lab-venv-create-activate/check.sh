#!/usr/bin/env bash
# Проверка: venv создан в ~/projects/venv-demo или в текущей директории
# Запускайте из ~/projects/venv-demo или из каталога, где создан venv
set -euo pipefail

errors=0
venv_path=""

# Ищем venv: текущая директория, ~/projects/venv-demo
for base in . "$HOME/projects/venv-demo"; do
    if [[ -d "$base/venv" ]] && [[ -f "$base/venv/bin/activate" ]]; then
        venv_path="$base/venv"
        break
    fi
done

if [[ -z "$venv_path" ]]; then
    echo "❌ FAIL: venv не найден в текущей директории или в ~/projects/venv-demo"
    echo "Создайте: mkdir -p ~/projects/venv-demo && cd ~/projects/venv-demo && python -m venv venv"
    errors=$((errors + 1))
else
    echo "✅ PASS: виртуальное окружение найдено — $venv_path"
fi

# Проверка 2: pyvenv.cfg и python
if [[ -n "$venv_path" ]]; then
    if [[ -f "$venv_path/pyvenv.cfg" ]]; then
        echo "✅ PASS: pyvenv.cfg присутствует"
    else
        echo "❌ FAIL: pyvenv.cfg не найден"
        errors=$((errors + 1))
    fi

    if [[ -f "$venv_path/bin/python" ]]; then
        echo "✅ PASS: bin/python присутствует"
    else
        echo "❌ FAIL: bin/python не найден"
        errors=$((errors + 1))
    fi
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
