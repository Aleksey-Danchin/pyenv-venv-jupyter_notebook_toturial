# Конспект: Модуль 10 — Проектная практика

> Краткий справочник для повторения. Подходит для печати.

## Ключевые понятия

| Понятие | Суть (1 предложение) |
|---------|---------------------|
| **Структура проекта** | Организация файлов и папок: src/, tests/, корневые файлы .python-version, requirements.txt |
| **`.gitignore`** | Файл с шаблонами имён, которые git не отслеживает (venv, __pycache__ и т.д.) |
| **`requirements-dev.txt`** | Файл с dev-зависимостями (pytest, jupyter, black); включает production через `-r requirements.txt` |
| **репозиторий (git)** | Директория с историей версий (папка .git); хранит коммиты и метаданные |
| **remote (origin)** | Удалённый репозиторий (например, на GitHub); подключается через `git remote add` |

## Важно запомнить

- Корень проекта: `.python-version`, `requirements.txt`, `README.md`, `venv/` (не коммитится), `src/`, `tests/`.
- `.gitignore` обязателен до первого коммита — иначе venv и `__pycache__` попадут в репозиторий.
- Production-зависимости — в `requirements.txt`; dev (pytest, jupyter) — в `requirements-dev.txt` с `-r requirements.txt`.
- Минимальный цикл git: `git init` → `git add .` → `git commit -m "..."` → `git remote add origin <URL>` → `git push -u origin main`.
- Это не курс по git — только контекст для публикации проекта.

## Команды модуля

```bash
# Git
git init                     # инициализация репозитория
git status                   # статус файлов
git add .                    # добавить все (с учётом .gitignore)
git commit -m "Сообщение"    # зафиксировать коммит
git remote add origin <URL>  # подключить удалённый репозиторий
git push -u origin main      # отправить на GitHub (main или master)
```

## Типичные ошибки (коротко)

| Ошибка | Причина | Решение |
|--------|---------|---------|
| venv в репозитории | забыли .gitignore или добавили до .gitignore | Добавить venv/ в .gitignore, `git reset HEAD venv/` |
| Всё в одном requirements | смешали prod и dev | Разделить: requirements.txt и requirements-dev.txt |
| Коммит без .gitignore | поспешили с git add | Сначала .gitignore, потом git add |
| git push не работает | не задан remote | `git remote add origin <URL>` |
| Неправильная ветка | локально master, GitHub main | `git branch -M main` перед push |
