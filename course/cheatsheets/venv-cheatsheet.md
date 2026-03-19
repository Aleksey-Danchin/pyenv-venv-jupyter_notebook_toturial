# Справочник: venv

> Краткий справочник команд и понятий venv. Подробные объяснения — в [модуле 4](../04-venv-basics/README.md) и [модуле 5](../05-venv-advanced/README.md).

## Создание окружения

| Команда | Описание | Пример |
|---------|----------|--------|
| `python -m venv <dir>` | Создаёт виртуальное окружение в указанной директории. | `python -m venv venv` |
| `python3 -m venv <dir>` | То же, с явным указанием `python3`. | `python3 -m venv .venv` |
| `~/.pyenv/versions/<ver>/bin/python -m venv <dir>` | Создаёт venv от конкретной версии pyenv (без pyenv local). | `~/.pyenv/versions/3.11.7/bin/python -m venv venv` |
| `python -m venv --system-site-packages <dir>` | venv с доступом к системным site-packages. | `python -m venv --system-site-packages venv` |

## Активация и деактивация

| Команда | Описание | Пример |
|---------|----------|--------|
| `source <venv>/bin/activate` | Активирует окружение в bash/zsh (Linux). | `source venv/bin/activate` |
| `deactivate` | Деактивирует текущее активированное окружение. | `deactivate` |

## Проверка состояния

| Команда | Описание | Пример |
|---------|----------|--------|
| `echo $VIRTUAL_ENV` | Путь к активированному окружению; пусто, если не активировано. | `echo $VIRTUAL_ENV` |
| `which python` | В активированном venv показывает путь внутрь окружения. | `which python` |
| `pip --version` | В активированном venv показывает путь к pip внутри окружения. | `pip --version` |

## Удаление окружения

| Команда | Описание | Пример |
|---------|----------|--------|
| `deactivate` затем `rm -rf <dir>/` | Деактивировать и удалить venv (это просто директория). | `deactivate` → `rm -rf venv/` |

## requirements.txt в venv

| Команда | Описание | Пример |
|---------|----------|--------|
| `pip freeze > requirements.txt` | Сохранить зависимости (в активированном venv). | `pip freeze > requirements.txt` |
| `pip install -r requirements.txt` | Воспроизвести окружение по файлу. | `pip install -r requirements.txt` |

## Структура venv

| Элемент | Назначение |
|---------|------------|
| `bin/` | Исполняемые файлы: `python`, `pip`, `activate` |
| `lib/pythonX.Y/site-packages/` | Установленные пакеты окружения |
| `pyvenv.cfg` | Конфигурация: путь к базовому Python, версия |
