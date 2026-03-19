#!/usr/bin/env bash
# Проверка: создано виртуальное окружение (venv)
# Ожидается venv или .venv в текущей директории или родительской
set -euo pipefail

errors=0
venv_dir=""

# Ищем venv: текущая директория, родительская, ~/projects/venv-demo
for base in . .. "$HOME/projects/venv-demo"; do
    for name in venv .venv; do
        if [[ -d "$base/$name" ]] && [[ -f "$base/$name/bin/activate" ]]; then
            venv_dir="$base/$name"
            break 2
        fi
    done
done

if [[ -n "$venv_dir" ]]; then
    echo "✅ PASS: виртуальное окружение найдено — $venv_dir"
else
    echo "❌ FAIL: не найдена директория venv или .venv с файлом bin/activate"
    echo "Создайте окружение: python -m venv venv"
    errors=$((errors + 1))
fi

# Проверка структуры venv
if [[ -n "$venv_dir" ]]; then
    if [[ -f "$venv_dir/pyvenv.cfg" ]]; then
        echo "✅ PASS: pyvenv.cfg присутствует"
    else
        echo "❌ FAIL: pyvenv.cfg не найден — возможно, повреждённое окружение"
        errors=$((errors + 1))
    fi

    if [[ -d "$venv_dir/bin" ]] && [[ -d "$venv_dir/lib" ]]; then
        echo "✅ PASS: структура venv (bin/, lib/) корректна"
    else
        echo "❌ FAIL: ожидаются директории bin/ и lib/"
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
