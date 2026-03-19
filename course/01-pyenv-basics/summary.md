# Конспект: Модуль 1 — pyenv: установка и основы

> Краткий справочник для повторения. Подходит для печати.

## Ключевые понятия

| Понятие | Суть (1 предложение) |
|---------|---------------------|
| pyenv | Менеджер версий Python — позволяет устанавливать, переключать и удалять версии интерпретатора. |
| Зависимости сборки | Системные пакеты (компилятор, заголовочные файлы), необходимые для компиляции Python из исходников. |
| `~/.pyenv/versions/` | Директория, где pyenv хранит все установленные версии Python, каждая в отдельной поддиректории. |

## Важно запомнить

- pyenv управляет **версиями интерпретатора**, а не пакетами и не виртуальными окружениями.
- pyenv компилирует Python из исходников — поэтому нужны зависимости сборки.
- Все версии хранятся в `~/.pyenv/versions/` и не затрагивают системный Python.
- pyenv работает через механизм shims — добавляет `~/.pyenv/shims/` в начало `PATH`.
- `pyenv version` (без `s`) — текущая версия; `pyenv versions` (с `s`) — все установленные.
- Список доступных версий зашит в pyenv; для обновления нужно обновить сам pyenv.

## Команды модуля

```bash
# Установка зависимостей сборки
sudo apt install -y build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev curl git \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
  libffi-dev liblzma-dev

# Установка pyenv
curl https://pyenv.run | bash

# Проверка установки
pyenv --version

# Установка версии Python
pyenv install 3.12.0

# Все доступные версии
pyenv install --list

# Фильтрация по ветке
pyenv install --list | grep "^\s*3\.12"

# Установленные версии
pyenv versions

# Текущая активная версия
pyenv version

# Обновление pyenv
cd ~/.pyenv && git pull
```

## Типичные ошибки (коротко)

| Ошибка | Причина | Решение |
|--------|---------|---------|
| `pyenv install` падает с ошибкой ssl | Не установлен `libssl-dev` | `sudo apt install -y libssl-dev` |
| `pyenv: command not found` | pyenv не добавлен в `PATH` через `.bashrc` | Добавить инициализацию и перезапустить shell |
| `definition not found` при `pyenv install` | Опечатка в номере версии или pyenv устарел | Проверить номер версии; обновить pyenv |
| Путаница `version` и `versions` | Похожие имена команд | `version` — одна активная; `versions` — все установленные |

## Схема

```
pyenv install 3.12.0
        │
        ├── Скачивание исходников (python.org)
        ├── Компиляция (нужны зависимости сборки)
        └── Установка в ~/.pyenv/versions/3.12.0/
                ├── bin/python3.12
                ├── bin/pip3.12
                └── lib/...

~/.pyenv/shims/python  ──→  определение версии  ──→  ~/.pyenv/versions/<version>/bin/python
```
