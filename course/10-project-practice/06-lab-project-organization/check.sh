#!/usr/bin/env bash
# Проверка: организация проекта в ~/lab-project-organization
# Ожидается: структура, .gitignore, requirements, venv, git repo, src/main.py
set -euo pipefail

LAB_DIR="$HOME/lab-project-organization"

if [[ ! -d "$LAB_DIR" ]]; then
    echo "❌ FAIL: Директория $LAB_DIR не найдена"
    echo "Создайте проект: mkdir -p $LAB_DIR && cd $LAB_DIR"
    exit 1
fi

errors=0

# Структура
for f in .python-version .gitignore requirements.txt requirements-dev.txt README.md; do
    if [[ ! -f "$LAB_DIR/$f" ]]; then
        echo "❌ FAIL: Файл $f отсутствует"
        errors=$((errors + 1))
    fi
done

if [[ ! -d "$LAB_DIR/src" ]]; then
    echo "❌ FAIL: Папка src/ отсутствует"
    errors=$((errors + 1))
fi

if [[ ! -d "$LAB_DIR/tests" ]]; then
    echo "❌ FAIL: Папка tests/ отсутствует"
    errors=$((errors + 1))
fi

# main.py
if [[ ! -f "$LAB_DIR/src/main.py" ]]; then
    echo "❌ FAIL: Файл src/main.py отсутствует"
    errors=$((errors + 1))
fi

# .gitignore проверка: venv и __pycache__ должны быть
if [[ -f "$LAB_DIR/.gitignore" ]]; then
    if ! grep -qE 'venv|__pycache__' "$LAB_DIR/.gitignore"; then
        echo "❌ FAIL: .gitignore должен содержать venv и __pycache__"
        errors=$((errors + 1))
    fi
fi

# venv
if [[ ! -d "$LAB_DIR/venv" ]] || [[ ! -f "$LAB_DIR/venv/bin/activate" ]]; then
    echo "❌ FAIL: Виртуальное окружение venv не создано или неполное"
    errors=$((errors + 1))
fi

# Пакеты в venv
if [[ -d "$LAB_DIR/venv" ]]; then
    VENV_PYTHON="$LAB_DIR/venv/bin/python"
    if ! "$VENV_PYTHON" -c "import requests" 2>/dev/null; then
        echo "❌ FAIL: Пакет requests не установлен в venv"
        errors=$((errors + 1))
    fi
    if ! "$VENV_PYTHON" -c "import pytest" 2>/dev/null; then
        echo "❌ FAIL: Пакет pytest не установлен в venv"
        errors=$((errors + 1))
    fi
fi

# git repo
if [[ ! -d "$LAB_DIR/.git" ]]; then
    echo "❌ FAIL: Git-репозиторий не инициализирован (.git отсутствует)"
    errors=$((errors + 1))
fi

# Минимум 2 коммита
if [[ -d "$LAB_DIR/.git" ]]; then
    COMMIT_COUNT=$(cd "$LAB_DIR" && git rev-list --count HEAD 2>/dev/null || echo "0")
    if [[ "$COMMIT_COUNT" -lt 2 ]]; then
        echo "❌ FAIL: Ожидается минимум 2 коммита (структура + main.py), найдено: $COMMIT_COUNT"
        errors=$((errors + 1))
    fi
fi

# main.py вывод
if [[ -f "$LAB_DIR/src/main.py" ]]; then
    OUTPUT=$("$LAB_DIR/venv/bin/python" "$LAB_DIR/src/main.py" 2>&1 || true)
    if [[ "$OUTPUT" != *"Hello, project!"* ]]; then
        echo "❌ FAIL: src/main.py должен выводить 'Hello, project!', получено: $OUTPUT"
        errors=$((errors + 1))
    fi
fi

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Найдено ошибок: $errors"
    exit 1
fi

echo "✅ PASS: Лабораторная выполнена корректно"
echo "Структура проекта, .gitignore, requirements, venv, git — всё на месте."
