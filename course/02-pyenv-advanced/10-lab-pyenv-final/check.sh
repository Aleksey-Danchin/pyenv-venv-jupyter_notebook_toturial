#!/usr/bin/env bash
# Проверка: итоговая лабораторная по pyenv (Модули 1–2)
set -euo pipefail

PASS=0
FAIL=0

# --- Проверка 1: pyenv установлен ---
if command -v pyenv &>/dev/null; then
    echo "✅ PASS: pyenv установлен"
    ((PASS++))
else
    echo "❌ FAIL: pyenv не найден"
    ((FAIL++))
    exit 1
fi

# --- Проверка 2: версия 3.11.7 установлена ---
if pyenv versions --bare | grep -q "^3\.11\.7$"; then
    echo "✅ PASS: Python 3.11.7 установлен"
    ((PASS++))
else
    echo "❌ FAIL: Python 3.11.7 не установлен"
    ((FAIL++))
fi

# --- Проверка 3: версия 3.12.0 установлена ---
if pyenv versions --bare | grep -q "^3\.12\.0$"; then
    echo "✅ PASS: Python 3.12.0 установлен"
    ((PASS++))
else
    echo "❌ FAIL: Python 3.12.0 не установлен"
    ((FAIL++))
fi

# --- Проверка 4: глобальная версия — 3.12.0 ---
GLOBAL_VERSION=$(pyenv global)
if [[ "$GLOBAL_VERSION" == "3.12.0" ]]; then
    echo "✅ PASS: глобальная версия — 3.12.0"
    ((PASS++))
else
    echo "❌ FAIL: глобальная версия — $GLOBAL_VERSION, ожидалась 3.12.0"
    ((FAIL++))
fi

# --- Проверка 5: директория ~/lab-pyenv-final существует ---
if [[ -d "$HOME/lab-pyenv-final" ]]; then
    echo "✅ PASS: директория ~/lab-pyenv-final существует"
    ((PASS++))
else
    echo "❌ FAIL: директория ~/lab-pyenv-final не найдена"
    ((FAIL++))
fi

# --- Проверка 6: поддиректория subdir существует ---
if [[ -d "$HOME/lab-pyenv-final/subdir" ]]; then
    echo "✅ PASS: директория ~/lab-pyenv-final/subdir существует"
    ((PASS++))
else
    echo "❌ FAIL: директория ~/lab-pyenv-final/subdir не найдена"
    ((FAIL++))
fi

# --- Проверка 7: .python-version отсутствует ---
if [[ ! -f "$HOME/lab-pyenv-final/.python-version" ]]; then
    echo "✅ PASS: файл .python-version удалён из ~/lab-pyenv-final"
    ((PASS++))
else
    echo "❌ FAIL: файл .python-version всё ещё существует"
    ((FAIL++))
fi

# --- Проверка 8: PYENV_VERSION не задана ---
if [[ -z "${PYENV_VERSION:-}" ]]; then
    echo "✅ PASS: переменная PYENV_VERSION не задана"
    ((PASS++))
else
    echo "❌ FAIL: переменная PYENV_VERSION задана: $PYENV_VERSION"
    ((FAIL++))
fi

# --- Проверка 9: в ~/lab-pyenv-final действует глобальная версия 3.12.0 ---
if [[ -d "$HOME/lab-pyenv-final" ]]; then
    EFFECTIVE=$(cd "$HOME/lab-pyenv-final" && pyenv version-name)
    if [[ "$EFFECTIVE" == "3.12.0" ]]; then
        echo "✅ PASS: в ~/lab-pyenv-final действует версия 3.12.0 (global)"
        ((PASS++))
    else
        echo "❌ FAIL: в ~/lab-pyenv-final действует версия $EFFECTIVE, ожидалась 3.12.0"
        ((FAIL++))
    fi
fi

# --- Итоги ---
echo ""
echo "================================"
echo "Результат: $PASS пройдено, $FAIL провалено"
if [[ "$FAIL" -eq 0 ]]; then
    echo "✅ Все проверки пройдены!"
else
    echo "❌ Есть ошибки — проверьте задание"
    exit 1
fi
