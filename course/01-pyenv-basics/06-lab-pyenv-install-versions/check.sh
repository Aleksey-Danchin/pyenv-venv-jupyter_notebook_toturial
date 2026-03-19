#!/usr/bin/env bash
# Проверка: установлена версия Python 3.11.x через pyenv
set -euo pipefail

errors=0

# Проверка 1: pyenv доступен
if ! command -v pyenv &>/dev/null; then
    echo "❌ FAIL: pyenv не найден в PATH"
    echo "Установите pyenv (юнит 02) перед выполнением лабораторной."
    exit 1
fi

# Проверка 2: установлена хотя бы одна версия 3.11.x
if pyenv versions --bare | grep -q "^3\.11\."; then
    version=$(pyenv versions --bare | grep "^3\.11\." | head -1)
    echo "✅ PASS: найдена установленная версия Python $version"
else
    echo "❌ FAIL: не найдена установленная версия Python 3.11.x"
    echo "Установите: pyenv install 3.11.7"
    errors=$((errors + 1))
fi

# Проверка 3: бинарник существует
if pyenv versions --bare | grep -q "^3\.11\."; then
    version=$(pyenv versions --bare | grep "^3\.11\." | head -1)
    bin_path="$HOME/.pyenv/versions/$version/bin/python3.11"
    if [[ -f "$bin_path" ]]; then
        echo "✅ PASS: бинарник найден — $bin_path"
    else
        echo "❌ FAIL: бинарник не найден — $bin_path"
        errors=$((errors + 1))
    fi
fi

# Проверка 4: установлено больше одной версии (помимо system)
count=$(pyenv versions --bare | wc -l)
if [[ $count -ge 2 ]]; then
    echo "✅ PASS: установлено версий Python (кроме system): $count"
else
    echo "ℹ️  INFO: установлена только одна версия Python (кроме system): $count"
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo ""
echo "Все проверки пройдены."
