#!/usr/bin/env bash
# Проверка: переключение версий Python через pyenv
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
    echo "Установите pyenv (см. Модуль 1, Тренажёр 02)"
    exit 1
fi

# --- Проверка 2: минимум две версии Python установлены (помимо system) ---
INSTALLED=$(pyenv versions --bare | wc -l)
if [[ "$INSTALLED" -ge 2 ]]; then
    echo "✅ PASS: установлено $INSTALLED версий Python через pyenv"
    ((PASS++))
else
    echo "❌ FAIL: установлено менее 2 версий Python через pyenv (найдено: $INSTALLED)"
    ((FAIL++))
fi

# --- Проверка 3: глобальная версия установлена (не system) ---
GLOBAL_VERSION=$(pyenv global)
if [[ "$GLOBAL_VERSION" != "system" && -n "$GLOBAL_VERSION" ]]; then
    echo "✅ PASS: глобальная версия установлена: $GLOBAL_VERSION"
    ((PASS++))
else
    echo "❌ FAIL: глобальная версия не установлена или равна system"
    ((FAIL++))
fi

# --- Проверка 4: директория ~/lab-versions существует ---
if [[ -d "$HOME/lab-versions" ]]; then
    echo "✅ PASS: директория ~/lab-versions существует"
    ((PASS++))
else
    echo "❌ FAIL: директория ~/lab-versions не найдена"
    ((FAIL++))
fi

# --- Проверка 5: файл .python-version отсутствует в ~/lab-versions ---
if [[ ! -f "$HOME/lab-versions/.python-version" ]]; then
    echo "✅ PASS: файл .python-version удалён из ~/lab-versions"
    ((PASS++))
else
    echo "❌ FAIL: файл .python-version всё ещё существует в ~/lab-versions"
    ((FAIL++))
fi

# --- Проверка 6: PYENV_VERSION не задана ---
if [[ -z "${PYENV_VERSION:-}" ]]; then
    echo "✅ PASS: переменная PYENV_VERSION не задана"
    ((PASS++))
else
    echo "❌ FAIL: переменная PYENV_VERSION задана: $PYENV_VERSION"
    ((FAIL++))
fi

# --- Проверка 7: в ~/lab-versions действует глобальная версия ---
if [[ -d "$HOME/lab-versions" ]]; then
    EFFECTIVE=$(cd "$HOME/lab-versions" && pyenv version-name)
    if [[ "$EFFECTIVE" == "$GLOBAL_VERSION" ]]; then
        echo "✅ PASS: в ~/lab-versions действует глобальная версия ($EFFECTIVE)"
        ((PASS++))
    else
        echo "❌ FAIL: в ~/lab-versions действует версия $EFFECTIVE, ожидалась $GLOBAL_VERSION"
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
