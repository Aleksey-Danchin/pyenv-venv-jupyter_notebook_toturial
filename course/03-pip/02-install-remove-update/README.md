← [Назад](../01-what-is-pip-pypi/README.md) | [Оглавление](../../README.md) | [Далее →](../03-freeze-list-requirements/README.md)

# Установка, удаление и обновление пакетов

> **Модуль 3 · Урок 2** | Время: ~20 мин

## Установка пакета по имени

Команда `pip install <package>` скачивает пакет с PyPI и устанавливает его в site-packages текущего окружения Python:

```bash
python3 -m pip install requests
```

```
Collecting requests
  Downloading requests-2.31.0-py3-none-any.whl (62 kB)
Installed collected packages: requests
Successfully installed requests-2.31.0
```

Рекомендуется всегда использовать `python3 -m pip`, а не просто `pip` — так вы явно указываете интерпретатор.

## Установка конкретной версии

Чтобы зафиксировать версию пакета:

```bash
python3 -m pip install requests==2.28.0
```

Можно указать диапазон:

```bash
python3 -m pip install "requests>=2.28,<3.0"
```

## Просмотр информации о пакете

Команда `pip show` показывает метаданные установленного пакета:

```bash
python3 -m pip show requests
```

```
Name: requests
Version: 2.31.0
Summary: Python HTTP for Humans.
Home-page: https://requests.readthedocs.io
...
Location: /home/user/.pyenv/versions/3.12.0/lib/python3.12/site-packages
```

Поле `Location` указывает, куда установлен пакет.

## Удаление пакета

Команда `pip uninstall` удаляет пакет:

```bash
python3 -m pip uninstall requests
```

pip спросит подтверждение. Чтобы удалить без вопроса, добавьте флаг `-y`:

```bash
python3 -m pip uninstall -y requests
```

## Обновление пакета

Чтобы обновить пакет до последней версии:

```bash
python3 -m pip install --upgrade requests
```

Или короче:

```bash
python3 -m pip install -U requests
```

Для обновления pip самого себя:

```bash
python3 -m pip install --upgrade pip
```

## Установка из requirements.txt

Если у вас есть файл со списком пакетов (подробнее — в уроке 03):

```bash
python3 -m pip install -r requirements.txt
```

## Частые ошибки

### Ошибка 1 — pip install без указания версии в продакшене

В продакшене и воспроизводимых окружениях **фиксируйте версии** пакетов. Иначе обновление PyPI может привести к новой версии с несовместимыми изменениями, и проект перестанет работать. Используйте `pip freeze` для фиксации (урок 03).

### Ошибка 2 — Глобальная установка вместо venv

Установка пакетов в глобальное окружение (системный или пользовательский site-packages) мешает разным проектам требовать разные версии одних и тех же библиотек. Начиная с модуля 4, вы будете использовать venv — всегда устанавливайте пакеты **внутри активированного виртуального окружения**.

### Ошибка 3 — Забыть про зависимости

pip автоматически устанавливает зависимости указанного пакета. Но при удалении (`pip uninstall`) удаляется только указанный пакет — его зависимости остаются. Если нужно полностью очистить окружение, создайте новое venv.

---
← [Назад](../01-what-is-pip-pypi/README.md) | [Оглавление](../../README.md) | [Далее →](../03-freeze-list-requirements/README.md)
