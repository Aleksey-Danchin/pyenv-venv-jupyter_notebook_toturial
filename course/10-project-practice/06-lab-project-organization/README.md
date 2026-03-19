← [Назад](../05-test-project-organization/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)

# Лабораторная: организация проекта

> **Модуль 10 · Лабораторная** | Время: ~35 мин

## Задание

В директории `~/lab-project-organization` (создайте её) выполните полный цикл организации Python-проекта:

1. Создайте структуру: `src/`, `tests/`, файлы `.python-version`, `requirements.txt`, `requirements-dev.txt`, `README.md`.
2. Добавьте `.gitignore` с типовыми исключениями для Python (venv, `__pycache__`, `.ipynb_checkpoints` и т.д.).
3. Создайте venv, установите в него `requests` (в requirements.txt) и `pytest` (в requirements-dev.txt).
4. Инициализируйте git-репозиторий, сделайте первый коммит.
5. Добавьте в `src/` простой файл `main.py` с `print("Hello, project!")` и закоммитьте его.

В конце проверьте результат скриптом `check.sh`.

## Требования

- Директория: `~/lab-project-organization`
- Структура: `src/`, `tests/`, `.python-version`, `requirements.txt`, `requirements-dev.txt`, `README.md`, `.gitignore`
- venv с пакетами `requests` (в requirements.txt) и `pytest` (в requirements-dev.txt)
- `src/main.py` с `print("Hello, project!")`
- Git-репозиторий с минимум двумя коммитами (структура + main.py)

## Подсказка 1

<details><summary>Показать подсказку</summary>

Создайте директорию и перейдите в неё. Используйте `pyenv local 3.11.7` (или другую установленную версию). Создайте папки `src/` и `tests/`, пустые файлы `README.md` и `.python-version`. В `.python-version` напишите версию, например `3.11.7`.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Создайте `.gitignore` со строками: `venv/`, `__pycache__/`, `*.pyc`, `.ipynb_checkpoints/`, `.env`. Создайте venv: `python -m venv venv`, активируйте, установите `pip install requests` и `pip freeze > requirements.txt`. Отдельно создайте `requirements-dev.txt` с одной строкой `pytest` (или `pip freeze` после установки pytest и оставьте только pytest и зависимости).

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Выполните `git init`, затем `git add .` (убедитесь по `git status`, что venv не добавлен), `git commit -m "Структура проекта"`. Создайте `src/main.py` с содержимым `print("Hello, project!")`, затем `git add src/main.py`, `git commit -m "Добавлен main.py"`. Запустите `check.sh` из директории лабораторной.

</details>

## Самопроверка

```bash
cd ~/lab-project-organization
git log --oneline
```

**Ожидаемый результат:** минимум два коммита в истории.

```bash
source venv/bin/activate
python -c "import requests; print('requests OK')"
python -c "import pytest; print('pytest OK')"
python src/main.py
deactivate
```

**Ожидаемый вывод:** `requests OK`, `pytest OK`, `Hello, project!`

---
← [Назад](../05-test-project-organization/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)
