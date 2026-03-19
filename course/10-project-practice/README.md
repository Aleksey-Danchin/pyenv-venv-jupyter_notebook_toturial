← [Предыдущий модуль](../09-jupyterlab/README.md) | [Оглавление](../README.md) | [Следующий модуль →](../11-integration/README.md)

# Модуль 10. Проектная практика

> **Время:** ~2 дня (при темпе 1–2 часа в день)

## Чему вы научитесь

- Организовывать Python-проект по типовой структуре
- Настраивать `.gitignore` для исключения venv, кеша и служебных файлов
- Разделять production- и dev-зависимости в requirements
- Инициализировать Git-репозиторий и выполнять первый коммит
- Публиковать проект на GitHub (базовый минимум)

## Что будет рассмотрено

| Тема | Описание |
|------|----------|
| Структура проекта | src/, tests/, docs; .python-version, requirements.txt |
| .gitignore | venv, __pycache__, .ipynb_checkpoints, шаблон для Python |
| requirements.txt vs requirements-dev.txt | Разделение production и dev-зависимостей |
| Базовый git | init, add, commit, push, remote, GitHub |

## Инструменты и команды

| Команда / инструмент | Назначение |
|---------------------|-----------|
| `.gitignore` | Исключение файлов из индексации Git |
| `requirements.txt` / `requirements-dev.txt` | Фиксация зависимостей production и dev |
| `git init` | Инициализация репозитория |
| `git add`, `git commit`, `git push` | Добавление, коммит, отправка на удалённый репозиторий |

> **Важно:** это не курс по Git. Базовые команды даны для контекста — достаточно для публикации проекта.

## Содержание модуля

| # | Юнит | Тип | Время |
|---|------|-----|-------|
| 01 | [Структура Python-проекта: что где лежит](01-project-structure/README.md) | Урок | ~15 мин |
| 02 | [.gitignore для Python-проектов](02-gitignore-python/README.md) | Урок | ~10 мин |
| 03 | [requirements.txt vs requirements-dev.txt](03-requirements-vs-dev/README.md) | Урок | ~15 мин |
| 04 | [Базовый git: init, add, commit, push, GitHub](04-basic-git/README.md) | Урок | ~20 мин |
| 05 | [Тест: организация проекта](05-test-project-organization/README.md) | Тест | ~15 мин |
| 06 | [Лабораторная: организация проекта](06-lab-project-organization/README.md) | Лабораторная | ~30 мин |

---

## Итоги модуля

### Что вы изучили

- **Структура проекта** — src/, tests/, docs/; .python-version и requirements в корне.
- **.gitignore** — исключение venv/, __pycache__/, .ipynb_checkpoints/, .env и др.
- **Разделение зависимостей** — requirements.txt для production, requirements-dev.txt для разработки (pytest, jupyter, black).
- **Базовый git** — init, add, commit, push, remote; создание репозитория на GitHub.

### Чеклист навыков

Отметьте то, что вы уверенно можете сделать:

- [ ] Создать типовую структуру Python-проекта (src, tests, .python-version)
- [ ] Настроить .gitignore для исключения venv, __pycache__, .ipynb_checkpoints
- [ ] Разделить зависимости на requirements.txt и requirements-dev.txt
- [ ] Инициализировать Git-репозиторий и выполнить первый коммит
- [ ] Подключить remote и отправить проект на GitHub

### Ключевые команды

```bash
git init
git add .
git status
git commit -m "Сообщение"
git remote add origin <URL>
git push -u origin main
```

---
← [Предыдущий модуль](../09-jupyterlab/README.md) | [Оглавление](../README.md) | [Следующий модуль →](../11-integration/README.md)
