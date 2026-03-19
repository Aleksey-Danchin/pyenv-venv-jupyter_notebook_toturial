#!/usr/bin/env bash
# Проверка: pyenv установлен и доступен в PATH
set -euo pipefail

errors=0

# Проверка 1: команда pyenv доступна
if command -v pyenv &>/dev/null; then
    echo "✅ PASS: команда pyenv найдена — $(command -v pyenv)"
else
    echo "❌ FAIL: команда pyenv не найдена в PATH"
    errors=$((errors + 1))
fi

# Проверка 2: pyenv --version выполняется
if pyenv --version &>/dev/null; then
    echo "✅ PASS: pyenv --version — $(pyenv --version)"
else
    echo "❌ FAIL: pyenv --version завершилась с ошибкой"
    errors=$((errors + 1))
fi

# Проверка 3: директория ~/.pyenv существует
if [[ -d "$HOME/.pyenv" ]]; then
    echo "✅ PASS: директория ~/.pyenv существует"
else
    echo "❌ FAIL: директория ~/.pyenv не найдена"
    errors=$((errors + 1))
fi

# Проверка 4: shims в PATH
if echo "$PATH" | grep -q ".pyenv/shims"; then
    echo "✅ PASS: ~/.pyenv/shims присутствует в PATH"
else
    echo "❌ FAIL: ~/.pyenv/shims отсутствует в PATH"
    errors=$((errors + 1))
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors. Проверьте установку pyenv."
    exit 1
fi

echo ""
echo "Все проверки пройдены."
