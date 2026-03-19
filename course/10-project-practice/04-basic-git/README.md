← [Назад](../03-requirements-vs-dev/README.md) | [Оглавление](../../README.md) | [Далее →](../05-test-project-organization/README.md)

# Базовый git: init, add, commit, push

> **Модуль 10 · Урок 4** | Время: ~15 мин

> **Важно:** это не курс по git. Ниже — минимальный набор команд, достаточный для инициализации репозитория и публикации проекта на GitHub. Для углублённого изучения git смотрите специализированные материалы.

## Назначение git

**Git** — распределённая система контроля версий. Она хранит историю изменений файлов, позволяет откатываться к прошлым версиям и работать совместно с другими разработчиками. GitHub — один из популярных хостингов git-репозиториев.

## Инициализация репозитория

Команда `git init` создаёт в текущей директории скрытую папку `.git` и превращает её в git-репозиторий[^глоссарий](../../references/glossary.md):

```bash
cd ~/my_project
git init
```

Вывод:

```
Initialized empty Git repository in /home/user/my_project/.git/
```

Повторный `git init` в уже инициализированной директории безопасен — git сообщит, что репозиторий уже существует.

## Проверка статуса

Команда `git status` показывает, какие файлы изменены, добавлены в индекс (staging) или не отслеживаются:

```bash
git status
```

Пример вывода:

```
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md
        requirements.txt
        src/
```

## Добавление файлов в индекс

Команда `git add` подготавливает файлы к коммиту (добавляет в staging area):

```bash
git add README.md requirements.txt src/
```

Или добавить всё, что не в `.gitignore`:

```bash
git add .
```

**Перед `git add` убедитесь, что `.gitignore` настроен.** Иначе venv, `__pycache__` и подобное попадут в репозиторий.

## Первый коммит

Команда `git commit` сохраняет изменения в локальную историю:

```bash
git commit -m "Первый коммит: структура проекта, requirements"
```

Флаг `-m` задаёт сообщение коммита. Без него откроется редактор для ввода сообщения.

## Подключение удалённого репозитория

Чтобы отправить код на GitHub, создайте репозиторий на [github.com](https://github.com) (кнопка «New repository»). После создания GitHub покажет URL, например:

```
https://github.com/username/my_project.git
```

Подключите его как remote:

```bash
git remote add origin https://github.com/username/my_project.git
```

Имя `origin` — традиционное для основного удалённого репозитория.

## Отправка на GitHub

Команда `git push` отправляет коммиты на удалённый сервер:

```bash
git push -u origin main
```

Флаг `-u` связывает локальную ветку `main` с удалённой `origin/main`, чтобы в дальнейшем можно было писать просто `git push`.

Если ветка по умолчанию у вас `master`, замените на:

```bash
git push -u origin master
```

## Минимальная последовательность

1. Создать `.gitignore` (venv, `__pycache__`, `.ipynb_checkpoints` и т.д.)
2. `git init`
3. `git add .`
4. `git status` — убедиться, что venv и лишнее не добавлены
5. `git commit -m "Первый коммит"`
6. Создать репозиторий на GitHub
7. `git remote add origin <URL>`
8. `git push -u origin main` (или `master`)

## Частые ошибки

### Ошибка 1 — Коммитить без проверки .gitignore

Перед `git add .` проверьте `git status` или содержимое `.gitignore`. Если venv уже добавлен в индекс, уберите: `git reset HEAD venv/` и добавьте `venv/` в `.gitignore`.

### Ошибка 2 — Забыть remote перед push

`git push` без аргументов не сработает, пока не задан `origin`. Выполните `git remote add origin <URL>` перед первым push. Проверить: `git remote -v`.

### Ошибка 3 — Push без коммитов

Git не отправит пустой репозиторий. Сделайте хотя бы один `git commit` перед `git push`.

### Ошибка 4 — Неправильная ветка

Если GitHub создал репозиторий с веткой `main`, а у вас локально `master`, при `git push origin master` создастся ветка `master` на GitHub. Для единообразия переименуйте локальную: `git branch -M main` перед push.

---
← [Назад](../03-requirements-vs-dev/README.md) | [Оглавление](../../README.md) | [Далее →](../05-test-project-organization/README.md)
